import 'package:copy_station/routers/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:copy_station/helper/color.dart';

class SetPassPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('支付密码管理'),
        leading: _back(context),
        backgroundColor: Colors.white,
      ),
      backgroundColor: bg_color,
      body: Container(
        child: InkWell(
          onTap: () {
            print('点击了设置密码按钮');
            Application.router.navigateTo(context, '/efficacyPass');
          },
          child: Container(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
            color: Colors.white,
            width: ScreenUtil().setWidth(750),
            height: ScreenUtil().setHeight(100),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text('设置密码'),
                  flex: 1,
                ),
                Container(
                  width: ScreenUtil().setWidth(20),
                  height: ScreenUtil().setHeight(40),
                  margin: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
                  child: Image.asset('images/arrows.png'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _back(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Application.router.navigateTo(context, '/personal');
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
