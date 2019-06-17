import 'dart:async';

import 'package:copy_station/helper/Toast.dart';
import 'package:copy_station/helper/data.dart';
import 'package:copy_station/homepages/drawer/payboard/CustomJPasswordFieldWidget.dart';
import 'package:copy_station/homepages/drawer/payboard/keyboard_widget.dart';
import 'package:copy_station/homepages/drawer/payboard/pay_password.dart';
import 'package:copy_station/routers/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 支付密码  +  自定义键盘

class main_keyboard extends StatefulWidget {
  static final String sName = "enter";

  @override
  State<StatefulWidget> createState() {
    return new keyboardState();
  }
}

class keyboardState extends State<main_keyboard> {
  String pwdData = '';

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  VoidCallback _showBottomSheetCallback;

  @override
  void initState() {
    _showBottomSheetCallback = _showBottomSheet;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(1334),
      child: Scaffold(
        key: _scaffoldKey,
        body: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext c) {
    return new Container(
      width: double.maxFinite,
      height: ScreenUtil().setHeight(300),
//      color: Color(0xffffffff),
      child: new Column(
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(50)),
            child: Data.safePayNum == 2
                ? Text(
                    '请再次填写以确认',
                    style: TextStyle(
                        color: Colors.brown,
                        fontSize: 18.0),
                  )
                : Text(
                    '请设置余额支付密码，用于支付验证',
                    style: new TextStyle(fontSize: 18.0, color: Colors.brown),
                  ),
          ),

          ///密码框
          new Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: _buildPwd(pwdData),
          ),

//          new Padding(
//            padding: const EdgeInsets.only(top: 20.0),
//            child: new Text(
//              '不是登录密码或连续数字',
//              style: new TextStyle(fontSize: 12.0, color: Color(0xff999999)),
//            ),
//          ),

//          new Padding(
//            padding: const EdgeInsets.only(top: 30.0), //0xffff0303
//            child: new Text(
//              '密码输入错误，还可输入2次，超出将锁定账户。',
//              style: new TextStyle(fontSize: 12.0, color: Color(0xffffffff)),
//            ),
//          ),
        ],
      ),
    );
  }

  /// 密码键盘 确认按钮 事件
  void onAffirmButton() {
    if (Data.safePayNum >= 2) {
      Toast.show(context, '设置成功');
      Application.router.navigateTo(context, '/setPass');
    } else {
      Application.router.navigateTo(context, '/setPayPass');
    }
  }

  void _onKeyDown(KeyEvent data) {
    if (data.isDelete()) {
      if (pwdData.length > 0) {
        pwdData = pwdData.substring(0, pwdData.length - 1);
        setState(() {});
      }
    } else if (data.isCommit()) {
      if (pwdData.length != 6) {
//        Fluttertoast.showToast(msg: "密码不足6位，请重试", gravity: ToastGravity.CENTER);
        return;
      }
      onAffirmButton();
    } else {
      if (pwdData.length < 6) {
        pwdData += data.key;
      }
      setState(() {});
    }
  }

  /// 底部弹出 自定义键盘  下滑消失
  void _showBottomSheet() {
    setState(() {
      // disable the button
      _showBottomSheetCallback = null;
    });
    _scaffoldKey.currentState
        .showBottomSheet<void>((BuildContext context) {
          return new MyKeyboard(_onKeyDown);
        })
        .closed
        .whenComplete(() {
          if (mounted) {
            setState(() {
              // re-enable the button
              _showBottomSheetCallback = _showBottomSheet;
            });
          }
        });
  }

  Widget _buildPwd(var pwd) {
    return new GestureDetector(
      child: new Container(
        width: 250.0,
        height: 40.0,
//      color: Colors.white,
        child: new CustomJPasswordField(pwd),
      ),
      onTap: () {
        _showBottomSheetCallback();
      },
    );
  }
}
