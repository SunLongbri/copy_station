import 'dart:convert';

import 'package:copy_station/routers/application.dart';
import 'package:copy_station/routers/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CollecTabRight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print('点击了工位详情 .... ');
        String url = "http://192.168.1.116:8080/detailItem?id=1";
        var json = jsonEncode(Utf8Encoder().convert(url));
        Application.router
            .navigateTo(context, '${Routes.webViewFlutter}?weburl=$json');
        },
      child: Container(
        color: Colors.white,
        width: ScreenUtil().setWidth(750),
        height: ScreenUtil().setHeight(250),
        child: Row(
          children: <Widget>[
            _imageInfo(),
            _workInfo(),
          ],
        ),
      ),
    );
  }

  Widget _imageInfo() {
    return Container(
      width: ScreenUtil().setHeight(250),
      height: ScreenUtil().setHeight(250),
      child: Image.asset(
        'images/home_station1.png',
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _workInfo() {
    return Container(
      height: ScreenUtil().setHeight(250),
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(10), top: ScreenUtil().setHeight(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '工位',
            style: TextStyle(
                color: Colors.black, fontSize: ScreenUtil().setSp(30)),
          ),
          Text(
            '共享工位',
            style:
                TextStyle(color: Colors.grey, fontSize: ScreenUtil().setSp(25)),
          ),
          Text(
            '150平方米',
            style:
                TextStyle(color: Colors.grey, fontSize: ScreenUtil().setSp(25)),
          ),
          Text(
            '容纳40人',
            style:
                TextStyle(color: Colors.grey, fontSize: ScreenUtil().setSp(25)),
          ),
          Row(
            children: <Widget>[
              Text(
                '￥1200.00',
                style: TextStyle(
                    color: Colors.grey, fontSize: ScreenUtil().setSp(30)),
              ),
              Text(
                '/月起',
                style: TextStyle(
                    color: Colors.grey, fontSize: ScreenUtil().setSp(25)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
