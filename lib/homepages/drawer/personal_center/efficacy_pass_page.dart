import 'dart:async';

import 'package:copy_station/helper/data.dart';
import 'package:copy_station/homepages/drawer/keyboard/keyboard_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EfficacyPassPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Data.safePayNum = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text('邦德乐思空间'),
        leading: _back(context),
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: ScreenUtil().setWidth(750),
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '已发送短信验证码至手机号',
              style: TextStyle(
                  color: Colors.orange, fontSize: ScreenUtil().setSp(35)),
            ),
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
              child: Text(
                '+86 17839999999999',
                style: TextStyle(
                    color: Colors.black, fontSize: ScreenUtil().setSp(35)),
              ),
            ),
            main_keyboard(),
          ],
        ),
      ),
    );
  }

  Widget _back(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.pop(
          context,
        );
      },
      child: Container(
        width: ScreenUtil().setWidth(20),
        height: ScreenUtil().setHeight(20),
        padding: EdgeInsets.all(20),
        child: InkWell(
          child: Image.asset('images/search_back_icon.png'),
        ),
      ),
    );
  }
}
