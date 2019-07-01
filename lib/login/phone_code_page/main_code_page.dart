import 'dart:async';

import 'package:copy_station/helper/Toast.dart';
import 'package:copy_station/helper/data.dart';
import 'package:copy_station/homepages/drawer/keyboard/keyboard_widget.dart';
import 'package:copy_station/homepages/drawer/keyboard/pay_password.dart';
import 'package:copy_station/model/user_login_model.dart';
import 'package:copy_station/net/service_method.dart';
import 'package:copy_station/net/service_url.dart';
import 'package:copy_station/routers/application.dart';
import 'package:copy_station/routers/routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'input_shape.dart';

class MainCodePage extends StatefulWidget {
  static final String sName = "enter";

  @override
  State<StatefulWidget> createState() {
    return new MainCodePageState();
  }
}

class MainCodePageState extends State<MainCodePage> {
  String pwdData = '';

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  VoidCallback _showBottomSheetCallback;

  @override
  void initState() {
    _showBottomSheetCallback = _showBottomSheet;
    reGetCountdown();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(Data.width),
      height: ScreenUtil().setHeight(Data.height),
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(35),
                    right: ScreenUtil().setWidth(35)),
                child: Image.asset(
                  'images/arros_back.png',
                ),
              )),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        key: _scaffoldKey,
        body: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext c) {
    return Container(
      width: double.maxFinite,
      height: ScreenUtil().setHeight(500),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(100),
                left: ScreenUtil().setWidth(41)),
            child: Text(
              '输入验证码',
              style: TextStyle(
                  color: Colors.brown,
                  fontSize: ScreenUtil().setSp(47),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
            width: ScreenUtil().setWidth(750),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ///密码框
                _fieldWidget()
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(47),
                left: ScreenUtil().setWidth(41)),
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                if (_codeCountdownStr.contains('获取验证码')) {
                  String phone = Data.prefs.getString('userPhone');
                  print('从本地获取到的phone:${phone}');
                  var formData = {'tel': phone};
                  post(formData, servicePath['sms']).then((val) {
                    if (val['code'] == 0) {
//            typeProvider.smsState = true;
                      Toast.show(context, '验证码发送成功!');
                      reGetCountdown();
                    } else {
//            typeProvider.smsState = false;
                      Toast.show(context, '验证码发送失败!');
                    }
                  });
                } else {
                  Toast.show(context, '请稍后再试!');
                }
              },
              child: Text(
                _codeCountdownStr,
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(36),
                    color: Colors.brown,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          _loginBth(context),
        ],
      ),
    );
  }

  Timer _countdownTimer;
  String _codeCountdownStr = '获取验证码';

  void reGetCountdown() {
    setState(() {
      if (_countdownTimer != null) {
        return;
      }
      // Timer的第一秒倒计时是有一点延迟的，为了立刻显示效果可以添加下一行。
      _codeCountdownStr = '(${Data.fastTime--}秒) 重新发送';
      _countdownTimer = new Timer.periodic(new Duration(seconds: 1), (timer) {
        setState(() {
          if (Data.fastTime > 0) {
            _codeCountdownStr = '(${Data.fastTime--}秒) 重新发送';
          } else {
            _codeCountdownStr = '获取验证码';
            Data.fastTime = 59;
            _countdownTimer.cancel();
            _countdownTimer = null;
          }
        });
      });
    });
  }

  // 不要忘记在这里释放掉Timer
  @override
  void dispose() {
    _countdownTimer?.cancel();
    _countdownTimer = null;
    super.dispose();
  }

  Widget _titleWidget() {
    return Container(
      child: Text(
        '请输入验证码',
        style: TextStyle(
            color: Colors.brown,
            fontSize: ScreenUtil().setSp(47),
            fontWeight: FontWeight.w500),
      ),
    );
  }

  TextEditingController codeController = TextEditingController();

  Widget _fieldWidget() {
    return Container(
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
        width: ScreenUtil().setWidth(650),
        child: Theme(
          data: ThemeData(primaryColor: Colors.brown),
          child: TextField(
            buildCounter: _counter,
            maxLength: 6,
            cursorColor: Colors.brown,
            keyboardType: TextInputType.number,
            controller: codeController,
          ),
        ));
  }

  Widget _counter(
    BuildContext context, {
    int currentLength,
    int maxLength,
    bool isFocused,
  }) {
    return Container();
  }

  Widget _loginBth(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        print('开始进入主界面');
        String phone = Data.prefs.getString('userPhone');
        String code = codeController.text.trim().toString();
        var formData = {'phone': phone, 'authcode': code};
        print('formData:${formData.toString()}');
        codeLogin(formData, servicePath['mobileLogin']).then((val) {
          print('手机号+验证码登录:${val}');
          if (val['errCode'] != 0) {
            Toast.show(context, val['message']);
          } else {
            Toast.show(context, '登录成功!');
            Application.router.navigateTo(context, Routes.homePage);
          }
        });
      },
      child: Container(
        width: ScreenUtil().setWidth(750),
        alignment: Alignment.centerRight,
        margin: EdgeInsets.only(right: ScreenUtil().setWidth(45)),
        child: Image.asset(
          'images/arrow.png',
          width: ScreenUtil().setWidth(101),
          height: ScreenUtil().setHeight(102),
        ),
      ),
    );
  }

  /// 密码键盘 确认按钮 事件
  void onAffirmButton() {}

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
        child: InputShape(pwd),
      ),
      onTap: () {
        _showBottomSheetCallback();
      },
    );
  }
}
