import 'dart:convert';
import 'dart:io';

import 'package:copy_station/provider/city_provider.dart';
import 'package:copy_station/provider/search_provider.dart';
import 'package:copy_station/routers/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import 'city_page/city_model.dart';
import 'drawer/left_drawer.dart';
import 'home_page/amap_navigator.dart';
import 'home_page/auto_swipe.dart';
import 'home_page/station_info.dart';

class HomePage extends StatelessWidget {
  Future<void> requestPermission(PermissionGroup permission) async {
    final List<PermissionGroup> permissions = <PermissionGroup>[permission];
    final Map<PermissionGroup, PermissionStatus> permissionRequestResult =
        await PermissionHandler().requestPermissions(permissions);
  }

  @override
  Widget build(BuildContext context) {
    requestPermission(PermissionGroup.location);
    requestPermission(PermissionGroup.locationAlways);
    requestPermission(PermissionGroup.locationWhenInUse);
    return WillPopScope(
      child: Scaffold(
        drawer: buildDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: _titleWidget(context),
          titleSpacing: 0.1,
          actions: <Widget>[_cityWidget(context)],
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                AutoSwipe(),
                Amap_Navigator(),
                StationInfo(),
                StationInfo(),
                StationInfo(),
              ],
            ),
          ),
        ),
      ),
      onWillPop: (){
        exit(0);
      },
    );
  }

  Widget _titleWidget(BuildContext context) {
    var searchProvider = Provider.of<SearchProvider>(context);
    return Container(
      height: ScreenUtil().setHeight(70),
      child: TextField(
          onTap: () {
            searchProvider.isSearch = false;
            Application.router.navigateTo(context, '/search');
          },
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: ScreenUtil().setHeight(12)),
              prefixIcon: Container(
                padding: EdgeInsets.fromLTRB(
                    ScreenUtil().setWidth(10),
                    ScreenUtil().setHeight(15),
                    ScreenUtil().setWidth(10),
                    ScreenUtil().setHeight(10)),
                child: Image.asset(
                  'images/search_icon.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
              border: InputBorder.none,
              hintText: '输入您想租用的办公室或社区空间',
              hintStyle: TextStyle(fontSize: ScreenUtil().setSp(25)))),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.brown,
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(2))),
    );
  }

  String cityName = '上海';

  Widget _cityWidget(BuildContext context) {
    var cityProvider = Provider.of<CityProvider>(context);
    return Container(
      margin: EdgeInsets.only(
          right: ScreenUtil().setWidth(10), left: ScreenUtil().setWidth(10)),
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
                cityName.cityName.toString(),
                style: TextStyle(color: Colors.brown),
              );
            }),
          ],
        ),
      ),
    );
  }
}
