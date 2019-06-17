import 'dart:convert';

import 'package:copy_station/routers/application.dart';
import 'package:copy_station/routers/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StationInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('访问房间详情页面 ... ');
        String url = "http://192.168.1.116:8080/detailItem?id=1";
        var json = jsonEncode(Utf8Encoder().convert(url));
//        Application.router.navigateTo(
//            context, '${Routes.webViewHelper}?weburl=$json');
        Application.router
            .navigateTo(context, '${Routes.webViewFlutter}?weburl=$json');
      },
      child: Container(
        width: ScreenUtil().setWidth(750),
        margin: EdgeInsets.only(
            bottom: ScreenUtil().setHeight(25),
            top: ScreenUtil().setHeight(15)),
        child: Column(
          children: <Widget>[_titlePic(), _detail()],
        ),
      ),
    );
  }

  Widget _titlePic() {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(300),
      child: Image.asset(
        'images/home_station1.png',
        width: ScreenUtil().setWidth(750),
        height: ScreenUtil().setHeight(300),
      ),
    );
  }

  Widget _detail() {
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(5),
                bottom: ScreenUtil().setHeight(5)),
            child: Text(
              '合谷文创-三友园⭐️⭐️⭐️374',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(40), color: Colors.brown),
            ),
          ),
          Text('[轻奢]多元化空间+办公区域，打造低碳、高性价比的整合资源的...',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(40),
                  color: Colors.brown,
                  fontWeight: FontWeight.w500)),
          Row(
            children: <Widget>[
              Text(
                'xxxx元起',
                style:
                    TextStyle(color: Colors.brown, fontWeight: FontWeight.w200),
              ),
              Text(
                '面积：100m 容纳：20人',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
