import 'dart:convert';

import 'package:copy_station/routers/application.dart';
import 'package:copy_station/routers/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleNavigator extends StatelessWidget {
  final String imageUrl;
  final String textTitle;
  final String textContent;

  SingleNavigator(this.imageUrl, this.textTitle, this.textContent);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              if (textTitle.contains('教育培训') ||
                  textTitle.contains('会议室') ||
                  textTitle.contains('工位') ||
                  textTitle.contains('办公室') ||
                  textTitle.contains('休闲空间') ||
                  textTitle.contains('其他')) {
//                String url = "https://www.siruish.cn/test";
                String url = "http://192.168.1.116:8080/map?pos=上海市";
                var json = jsonEncode(Utf8Encoder().convert(url));
                Application.router.navigateTo(
                    context, '${Routes.webViewHelper}?weburl=$json');
//                Application.router.navigateTo(
//                    context, '${Routes.webViewFlutter}?weburl=$json');
              }
            },
            child: Image.asset(
              imageUrl,
              fit: BoxFit.fitHeight,
            ),
          ),
          Text(
            textTitle,
            style: TextStyle(
                color: Colors.brown, fontSize: ScreenUtil().setSp(35)),
          ),
          Text(
            textContent,
            style:
                TextStyle(color: Colors.grey, fontSize: ScreenUtil().setSp(15)),
          ),
        ],
      ),
    );
  }
}
