import 'dart:convert';

import 'package:copy_station/routers/application.dart';
import 'package:copy_station/routers/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CollecTabLeft extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _communityPage(context),
    );
  }

  Widget _communityPage(BuildContext context) {
    return InkWell(
      onTap: () {
        print('进入到社区详情页面 ... ');
        String url = "http://192.168.1.116:8080/detailPark?id=333";
        var json = jsonEncode(Utf8Encoder().convert(url));
        Application.router
            .navigateTo(context, '${Routes.webViewFlutter}?weburl=$json');
      },
      child: Container(
        color: Colors.white,
        width: ScreenUtil().setWidth(750),
        height: ScreenUtil().setHeight(400),
        child: Stack(
          children: <Widget>[
            _topBg(),
            Align(
                alignment: FractionalOffset(0, 1.0),
                child: Container(
                  width: ScreenUtil().setWidth(750),
                  height: ScreenUtil().setHeight(150),
                  child: Row(
                    children: <Widget>[
                      _smallIcon(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _comuName(),
                          _detailInfo(),
                        ],
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _topBg() {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(310),
      child: Image.asset(
        'images/banner_01.png',
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _comuName() {
    return Container(
        height: ScreenUtil().setHeight(50),
        child: Padding(
          padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(5), top: ScreenUtil().setHeight(5)),
          child: Text(
            '亚龙国际',
            style: TextStyle(
                color: Colors.white, fontSize: ScreenUtil().setSp(35)),
          ),
        ));
  }

  Widget _smallIcon() {
    return Container(
      width: ScreenUtil().setWidth(150),
      height: ScreenUtil().setWidth(150),
      decoration: BoxDecoration(
          color: Colors.brown,
          borderRadius: BorderRadius.all(Radius.circular(2)),
          border:
              Border.all(color: Colors.white, width: ScreenUtil().setWidth(3))),
      child: Image.asset('images/home_icon.png'),
    );
  }

  Widget _detailInfo() {
    return Container(
        height: ScreenUtil().setHeight(100),
        width: ScreenUtil().setWidth(600),
        child: Stack(
          children: <Widget>[
            Align(
                alignment: FractionalOffset(0, 1),
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.star_border),
                      Icon(Icons.star_border),
                      Icon(Icons.star_border),
                      Icon(Icons.star_border),
                    ],
                  ),
                )),
            Align(
              alignment: FractionalOffset(1, 0.5),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '中国上海市上海市',
                      style: TextStyle(
                          color: Colors.grey, fontSize: ScreenUtil().setSp(30)),
                    ),
                    Text(
                      '距您1614.2公里',
                      style: TextStyle(
                          color: Colors.grey, fontSize: ScreenUtil().setSp(30)),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
