import 'dart:convert';

import 'package:copy_station/helper/Toast.dart';
import 'package:copy_station/provider/type_provider.dart';
import 'package:copy_station/routers/application.dart';
import 'package:copy_station/routers/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SingleNavigator extends StatelessWidget {
  final String imageUrl;
  final String textTitle;
  final String textContent;

  SingleNavigator(this.imageUrl, this.textTitle, this.textContent);

  @override
  Widget build(BuildContext context) {
    TypeProvider typeProvider = Provider.of<TypeProvider>(context);
    return Container(
      child: Column(
        children: <Widget>[
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              if (typeProvider.netError == true) {
                Toast.show(context, '请检查你的网络链接');
                return;
              }
              if (textTitle.contains('教育培训') ||
                  textTitle.contains('会议室') ||
                  textTitle.contains('工位') ||
                  textTitle.contains('办公室') ||
                  textTitle.contains('休闲空间') ||
                  textTitle.contains('其他')) {
//                String url = "https://www.siruish.cn/test";
                String url = "http://192.168.1.129:8080/map?pos=上海市";
//                String url = "http://www.baidu.com";
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
                color: Colors.brown,
                fontSize: ScreenUtil().setSp(32),
                fontWeight: FontWeight.w500),
          ),
          Text(
            textContent,
            style: TextStyle(
                color: Color(0x30040000),
                fontSize: ScreenUtil(allowFontScaling: true).setSp(18),
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
