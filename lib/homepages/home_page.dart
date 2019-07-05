import 'dart:convert';
import 'dart:io';

import 'package:copy_station/helper/Toast.dart';
import 'package:copy_station/model/housing_model.dart';
import 'package:copy_station/net/judge_network.dart';
import 'package:copy_station/net/service_method.dart';
import 'package:copy_station/net/service_url.dart';
import 'package:copy_station/provider/city_provider.dart';
import 'package:copy_station/provider/search_provider.dart';
import 'package:copy_station/provider/type_provider.dart';
import 'package:copy_station/routers/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import 'city_page/city_model.dart';
import 'drawer/left_drawer.dart';
import 'home_page/amap_navigator.dart';
import 'home_page/auto_swipe.dart';
import 'home_page/housing_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Rows> rows = [];
  GlobalKey<RefreshFooterState> _footerkey =
      new GlobalKey<RefreshFooterState>();

  @override
  void initState() {
    _getHousingInfo();
    super.initState();
  }

  Future<void> requestPermission(PermissionGroup permission) async {
    final List<PermissionGroup> permissions = <PermissionGroup>[permission];
    final Map<PermissionGroup, PermissionStatus> permissionRequestResult =
        await PermissionHandler().requestPermissions(permissions);
  }

  TypeProvider typeProvider;
  int pages = 1;

  void _getHousingInfo() {
    var formData = {'limit': 10, 'offset': pages};
    post(formData, servicePath['housingList']).then((val) {
      print('接收到的数据为:${val}');
      HousingModel housingModel = HousingModel.fromJson(val);
      if (housingModel.errCode == 0) {
        //请求成功
        setState(() {
          Data data = housingModel.data;
          int totalCount = data.count;
          rows = data.rows;
          print('房源数量为:${rows.length}');
        });
      } else {
        //请求失败
        Toast.show(context, '数据请求失败!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    requestPermission(PermissionGroup.location);
    judgeNetWork(context);
    TypeProvider typeProvider = Provider.of<TypeProvider>(context);

    if (typeProvider.netError == true) {
      //当前断网
      print('homePage:{当前断网}');
    } else {
      //当前网络通畅
      print('homePage:{当前网络通畅}');
    }

    return WillPopScope(
      child: Scaffold(
          drawer: buildDrawer(),
          appBar: AppBar(
            leading: Builder(
              builder: (context) => GestureDetector(
                    child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.only(
                              left: ScreenUtil().setWidth(20),
                              right: ScreenUtil().setWidth(20)),
                          child: Image.asset('images/home_leading_icon.png'),
                        )),
                    onTap: () => Scaffold.of(context).openDrawer(),
                  ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            title: _titleWidget(context),
            titleSpacing: 0.1,
            actions: <Widget>[_cityWidget(context)],
          ),
          body: EasyRefresh(
              refreshFooter: ClassicsFooter(
                key: _footerkey,
                bgColor: Colors.white,
                textColor: Colors.brown,
                moreInfoColor: Colors.brown,
                showMore: true,
                noMoreText: '',
                moreInfo: '加载中',
                loadReadyText: '上拉加载',
              ),
              loadMore: () async {
                print("开始加载更多 ... ");
                var formData = {'limit': 10, 'offset': pages++};
                await post(formData, servicePath['housingList']).then((val) {
                  print('下拉加载接收到的数据为:${val}');
                  HousingModel housingModel = HousingModel.fromJson(val);
                  if (housingModel.errCode == 0) {
                    //请求成功
                    setState(() {
                      Data data = housingModel.data;
                      int totalCount = data.count;
                      List<Rows> refreshRows = data.rows;
                      refreshRows.forEach((item) =>rows.add(item));
                      print('刷新房源数量为:${rows.length}');
                    });
                  } else {
                    //请求失败
                    Toast.show(context, '数据请求失败!');
                  }
                });
              },
              child: Stack(
                children: <Widget>[
                  Container(
                    height: ScreenUtil().setHeight(1334),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          AutoSwipe(),
                          Amap_Navigator(),
                          HousingList(rows: rows),
                        ],
                      ),
                    ),
                  ),
                  typeProvider.netError
                      ? _netTitleError('当前网络不可用，请检查你的网络设置')
                      : Container(),
//              _netErrorContent()
                ],
              ))),
      onWillPop: () {
        exit(0);
      },
    );
  }

  //服务器端异常，需要刷新操作
  Widget _netErrorContent() {
    return InkWell(
        onTap: () {
          print('点击了刷新按钮 ... ');
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
            color: Color(0xafffffff),
            width: ScreenUtil().setWidth(750),
            height: ScreenUtil().setHeight(1334),
            child: Stack(
              children: <Widget>[
                _netTitleError('异常出错，刷新或退出重试'),
                Align(
                  alignment: FractionalOffset(0.5, 0.5),
                  child: Container(
                    width: ScreenUtil().setWidth(144),
                    height: ScreenUtil().setHeight(250),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: ScreenUtil().setHeight(18)),
                          child: Image.asset(
                            'images/refresh_icon.png',
                            width: ScreenUtil().setWidth(81),
                            height: ScreenUtil().setHeight(81),
                          ),
                        ),
                        Container(
                          alignment: Alignment(0, 0),
                          width: ScreenUtil().setWidth(144),
                          height: ScreenUtil().setHeight(40),
                          child: Text(
                            '点击刷新',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(30)),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )));
  }

  //网络出错标题栏
  Widget _netTitleError(String content) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(100),
      color: Color(0xffFFF7F6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/net_error_icon.png',
            width: ScreenUtil().setWidth(52),
            height: ScreenUtil().setHeight(52),
          ),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
            child: Text(
              content,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: ScreenUtil().setSp(32)),
            ),
          )
        ],
      ),
    );
  }

  Widget _titleWidget(BuildContext context) {
    var searchProvider = Provider.of<SearchProvider>(context);
    return InkWell(
      onTap: () {
        searchProvider.isSearch = false;
        Application.router.navigateTo(context, '/search');
      },
      child: Container(
        height: ScreenUtil().setHeight(70),
        width: ScreenUtil().setWidth(609),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(10),
                  right: ScreenUtil().setWidth(10)),
              child: Image.asset(
                'images/search_icon.png',
                width: ScreenUtil().setWidth(35),
                height: ScreenUtil().setHeight(35),
                fit: BoxFit.fitWidth,
              ),
            ),
            Text(
              '输入您想租用的办公室或社区空间',
              style: TextStyle(
                  color: Colors.grey, fontSize: ScreenUtil().setSp(26)),
            )
          ],
        ),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.brown,
              width: 1,
            ),
            borderRadius: BorderRadius.all(Radius.circular(2))),
      ),
    );
  }

  String cityName = '上海';

  Widget _cityWidget(BuildContext context) {
    var cityProvider = Provider.of<CityProvider>(context);
    return Container(
      width: ScreenUtil().setWidth(110),
      margin: EdgeInsets.only(
          right: ScreenUtil().setWidth(10), left: ScreenUtil().setWidth(20)),
      child: InkWell(
        onTap: () {
          ///字符串编码
          String params = jsonEncode(Utf8Encoder().convert(cityName));
          Application.router
              .navigateTo(context, '/city?name=${params}')
              .then((result) {
            print('result:${result}');
            if (result != null) {
              //回传的数据
              var data = json.decode(result.toString());
              print('接收到的数据:${data.toString()}');
              String name = CityInfo.fromJson(data).name;
              print('name:${name}');

              cityProvider.cityName = name;
              cityName = name;
            }
          });
        },
        child: Row(
          children: <Widget>[
            Image.asset(
              'images/city_icon.png',
              width: ScreenUtil().setWidth(40),
              height: ScreenUtil().setHeight(40),
            ),
            Consumer<CityProvider>(builder: (context, cityName, _) {
              return Text(
                cityName.cityName.toString().substring(0, 2),
                style: TextStyle(color: Colors.brown),
              );
            }),
          ],
        ),
      ),
    );
  }
}
