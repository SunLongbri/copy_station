import 'dart:convert';

import 'package:copy_station/routers/application.dart';
import 'package:copy_station/routers/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:copy_station/helper/color.dart';

class OrderTabBar extends StatelessWidget {
  final List<Tab> myTabs = <Tab>[
    Tab(text: '空间订单'),
    Tab(text: '合同及账单'),
    Tab(text: '活动订单'),
    Tab(text: '服务订单'),
    Tab(text: '店铺订单'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Container(
        width: ScreenUtil().setWidth(750),
        height: ScreenUtil().setHeight(1180),
        child: Scaffold(
          appBar: TabBar(
            unselectedLabelColor: Colors.black,
            labelColor: Colors.brown,
            indicatorColor: Colors.brown,
            tabs: myTabs,
            isScrollable: true,
          ),
          body: new TabBarView(
            children: myTabs.map((Tab tab) {
              return SingleChildScrollView(
                child: Container(
                    alignment: Alignment.center,
                    color: Colors.white,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Divider(
                            height: ScreenUtil().setHeight(2),
                            color: Colors.grey,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: ScreenUtil().setWidth(20),
                                top: ScreenUtil().setHeight(20),
                                right: ScreenUtil().setHeight(20)),
                            child: Row(
                              children: <Widget>[
                                _singleSelect(context, '√ 待确认'),
                                _singleSelect(context, '√ 已完成'),
                                _singleSelect(context, '√ 退款'),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: ScreenUtil().setHeight(20)),
                            width: ScreenUtil().setWidth(750),
                            height: ScreenUtil().setHeight(30),
                            color: bg_color,
                          ),
                          _singleCart(context),
                          Container(
                            width: ScreenUtil().setWidth(750),
                            height: ScreenUtil().setHeight(30),
                            color: bg_color,
                          ),
                          _singleCart(context),
                        ],
                      ),
                    )),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _singleCart(BuildContext context) {
    return InkWell(
      onTap: () {
        print('点击了订单详情页面 ... ');
        String url = "http://192.168.1.116:8080/orderDetail?orderNum=454848464&status=0";
        var json = jsonEncode(Utf8Encoder().convert(url));
        Application.router
            .navigateTo(context, '${Routes.webViewFlutter}?weburl=$json');
      },
      child: Container(
        width: ScreenUtil().setWidth(750),
        height: ScreenUtil().setHeight(440),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _cartTitle(),
            Divider(
              color: Colors.grey,
            ),
            _cartContent(),
          ],
        ),
      ),
    );
  }

  Widget _cartTitle() {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(80),
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(20), right: ScreenUtil().setWidth(20)),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text('工位'),
            flex: 1,
          ),
          Text(
            '已取消',
            style: TextStyle(
                color: Colors.brown, fontSize: ScreenUtil().setSp(25)),
          )
        ],
      ),
    );
  }

  Widget _cartContent() {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(300),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment(0, -1),
            width: ScreenUtil().setWidth(170),
            child: CircleAvatar(
              backgroundImage: new AssetImage('images/home_icon.png'),
              radius: 35.0,
            ),
          ),
          _rightContent(),
        ],
      ),
    );
  }

  Widget _rightContent() {
    return Container(
      width: ScreenUtil().setWidth(550),
      height: ScreenUtil().setHeight(400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(10)),
            child: Text(
              '禾谷文创',
              style: TextStyle(
                  color: Colors.brown, fontSize: ScreenUtil().setSp(40)),
            ),
          ),
          Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '2019',
                    style: TextStyle(
                        color: Colors.black, fontSize: ScreenUtil().setSp(65)),
                  ),
                  Text(
                    '05/29 周三',
                    style: TextStyle(
                        color: Colors.black, fontSize: ScreenUtil().setSp(35)),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
                child: Text(
                  '至',
                  style: TextStyle(
                      color: Colors.grey, fontSize: ScreenUtil().setSp(35)),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '2019',
                    style: TextStyle(
                        color: Colors.black, fontSize: ScreenUtil().setSp(65)),
                  ),
                  Text(
                    '06/27 周四',
                    style: TextStyle(
                        color: Colors.black, fontSize: ScreenUtil().setSp(35)),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
            child: Text(
              '上海市闵行区1355号1楼2楼',
              style: TextStyle(
                  color: Colors.grey, fontSize: ScreenUtil().setSp(35)),
            ),
          ),
          Text(
            '￥1,100.00',
            style: TextStyle(
                color: Colors.brown, fontSize: ScreenUtil().setSp(40)),
          )
        ],
      ),
    );
  }

  Widget _singleSelect(BuildContext context, String content) {
    return InkWell(
      onTap: () {
        print('用户点击了顶部选择按钮 ...  ');
        String url = "http://192.168.1.116:8080/detailItem?id=1";
        var json = jsonEncode(Utf8Encoder().convert(url));
        Application.router
            .navigateTo(context, '${Routes.webViewHelper}?weburl=$json');
      },
      child: Container(
        alignment: Alignment(0, 0),
        margin: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
        width: ScreenUtil().setWidth(180),
        height: ScreenUtil().setHeight(70),
        child: Text(content),
        decoration: BoxDecoration(
            color: bg_color,
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
    );
  }
}
