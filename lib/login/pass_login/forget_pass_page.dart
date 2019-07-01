import 'dart:async';

import 'package:copy_station/helper/Toast.dart';
import 'package:copy_station/helper/data.dart';
import 'package:copy_station/net/service_method.dart';
import 'package:copy_station/net/service_url.dart';
import 'package:copy_station/routers/application.dart';
import 'package:copy_station/routers/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

class ForgetPassPage extends StatefulWidget {
  @override
  _ForgetPassPageState createState() => _ForgetPassPageState();
}

class _ForgetPassPageState extends State<ForgetPassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: _leadingWidget(),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
                top: ScreenUtil().setHeight(50),
                left: ScreenUtil().setWidth(30),
                right: ScreenUtil().setWidth(30)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _titleWidget(),
                _contentWidget(),
                _arrowWidget(context)
              ],
            ),
          ),
        ));
  }

  Widget _leadingWidget() {
    return InkWell(
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
        ));
  }

  Widget _titleWidget() {
    return Container(
      child: Text(
        '重置密码',
        style: TextStyle(
            color: Colors.brown,
            fontSize: ScreenUtil().setSp(48),
            fontWeight: FontWeight.bold),
      ),
    );
  }

  TextEditingController phoneController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController rePassController = TextEditingController();

  Widget _contentWidget() {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(50)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _phoneWidget(),
          Padding(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
          ),
          _codeWidget(),
          _passWidget(),
          _rePassWidget(),
        ],
      ),
    );
  }

  Widget _phoneWidget() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '手机号',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: ScreenUtil().setSp(36),
                color: Colors.brown),
          ),
          Theme(
            data: ThemeData(primaryColor: Colors.brown),
            child: TextField(
              controller: phoneController,
              cursorColor: Colors.brown,
              maxLength: 11,
              buildCounter: _counter,
              keyboardType: TextInputType.phone,
            ),
          ),
        ],
      ),
    );
  }

  Widget _codeWidget() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '输入验证码',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: ScreenUtil().setSp(36),
                color: Colors.brown),
          ),
          Container(
//            height: ScreenUtil().setHeight(80),
            child: Stack(
              children: <Widget>[
                Theme(
                  data: ThemeData(primaryColor: Colors.brown),
                  child: TextField(
                    controller: codeController,
                    cursorColor: Colors.brown,
                    maxLength: 11,
                    buildCounter: _counter,
                    keyboardType: TextInputType.phone,
                  ),
                ),
                Align(
                  alignment: FractionalOffset(1.0, 0.5),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: ScreenUtil().setHeight(20),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        print('获取验证码');
                        reGetCountdown();
                        var formData = {'phone': phoneController.text.toString()};
                        post(formData, servicePath['sms']).then((val) {
                          if (val['errCode'] == 0) {
//            typeProvider.smsState = true;
                            print('发送成功');
                            String phone =
                                phoneController.text.trim().toString();
                            Data.prefs.setString('userPhone', phone);
                          } else {
//            typeProvider.smsState = false;
                            print('发送失败');
                          }
                        });
                      },
                      child: Text(
                        _codeCountdownStr,
                        style: TextStyle(
                            color: Colors.brown,
                            fontSize: ScreenUtil().setSp(28),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Timer _countdownTimer;
  String _codeCountdownStr = '获取验证码';
  int _countdownNum = 59;

  void reGetCountdown() {
    setState(() {
      if (_countdownTimer != null) {
        return;
      }
      // Timer的第一秒倒计时是有一点延迟的，为了立刻显示效果可以添加下一行。
      _codeCountdownStr = '${_countdownNum--}s重新获取';
      _countdownTimer = new Timer.periodic(new Duration(seconds: 1), (timer) {
        setState(() {
          if (_countdownNum > 0) {
            _codeCountdownStr = '${_countdownNum--}s重新获取';
          } else {
            _codeCountdownStr = '获取验证码';
            _countdownNum = 59;
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

  bool showPass = true; //控制密码的可见与不可见,true表示密码不可见，false表示密码可见
  String passInfo = '显示';

  Widget _passWidget() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(Data.width),
            height: ScreenUtil().setHeight(50),
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: FractionalOffset(0.0, 0.5),
                  child: Text(
                    '密码',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: ScreenUtil().setSp(35),
                        color: Colors.brown),
                  ),
                ),
                Align(
                    alignment: FractionalOffset(1.0, 0.5),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          if (showPass) {
                            showPass = false;
                            passInfo = '隐藏';
                          } else {
                            showPass = true;
                            passInfo = '显示';
                          }
                        });
                      },
                      child: Text(
                        passInfo,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: ScreenUtil().setSp(28),
                            color: Colors.brown),
                      ),
                    )),
              ],
            ),
          ),
          Theme(
            data: ThemeData(primaryColor: Colors.brown),
            child: TextField(
              controller: passController,
              cursorColor: Colors.brown,
              obscureText: showPass,
              maxLength: 11,
              buildCounter: _counter,
              keyboardType: TextInputType.phone,
            ),
          ),
        ],
      ),
    );
  }

  Widget _rePassWidget() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _rePass(),
          Theme(
            data: ThemeData(primaryColor: Colors.brown),
            child: TextField(
              controller: rePassController,
              cursorColor: Colors.brown,
              obscureText: showRePass,
              maxLength: 11,
              buildCounter: _counter,
              keyboardType: TextInputType.phone,
            ),
          ),
        ],
      ),
    );
  }

  Widget _counter(
    BuildContext context, {
    int currentLength,
    int maxLength,
    bool isFocused,
  }) {
    return Container();
  }

  bool showRePass = true; //true密码样式显示，false明文显示
  String rePassInfo = '显示';

  Widget _rePass() {
    return Container(
      width: ScreenUtil().setWidth(Data.width),
      height: ScreenUtil().setHeight(50),
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: FractionalOffset(0.0, 0.5),
            child: Text(
              '再次输入密码',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: ScreenUtil().setSp(35),
                  color: Colors.brown),
            ),
          ),
          Align(
              alignment: FractionalOffset(1.0, 0.5),
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    if (showRePass) {
                      showRePass = false;
                      rePassInfo = '隐藏';
                    } else {
                      showRePass = true;
                      rePassInfo = '显示';
                    }
                  });
                },
                child: Text(
                  rePassInfo,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: ScreenUtil().setSp(28),
                      color: Colors.brown),
                ),
              )),
        ],
      ),
    );
  }

  /// md5 加密
  String generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }

  Widget _arrowWidget(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(80),
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(90)),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: FractionalOffset(1.0, 0.5),
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                String phone = phoneController.text.toString().trim();
                String code = codeController.text.toString().trim();
                String pass = passController.text.toString().trim();
                String rePass = rePassController.text.toString().trim();
                if (!pass.contains(rePass)) {
                  Toast.show(context, '两次密码不一致');
                  return;
                }
                if (phone.isEmpty ||
                    code.isEmpty ||
                    pass.isEmpty ||
                    rePass.isEmpty) {
                  Toast.show(context, '请完善登录信息!');
                  return;
                }
                var formData = {
                  'password': generateMd5(pass),
                  'authcode': code,
                  'identity': phone
                };
                post(formData, servicePath['resetPass']).then((val) {
                  print('val:${val}');
                  if (val['errCode'] == 0) {
                    Toast.show(context, '登录成功!');
                    Application.router.navigateTo(context, Routes.homePage);
                  } else {
                    Toast.show(context, val['message']);
                  }
                  print('获取到的手机号为:${phone}');
                });
              },
              child: Image.asset(
                'images/arrow.png',
                width: ScreenUtil().setWidth(103),
                height: ScreenUtil().setHeight(103),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
