import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:copy_station/helper/Toast.dart';
import 'package:copy_station/helper/data.dart';
import 'package:copy_station/model/pass_login_model.dart';
import 'package:copy_station/net/service_method.dart';
import 'package:copy_station/net/service_url.dart';
import 'package:copy_station/routers/application.dart';
import 'package:copy_station/routers/routes.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserPassPage extends StatefulWidget {
  @override
  _UserPassPageState createState() => _UserPassPageState();
}

class _UserPassPageState extends State<UserPassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                _forgetPass(),
                _arrowWidget(context)
              ],
            ),
          ),
        ));
  }

  Widget _titleWidget() {
    return Container(
      child: Text(
        '登录',
        style: TextStyle(
            color: Colors.brown,
            fontSize: ScreenUtil().setSp(48),
            fontWeight: FontWeight.bold),
      ),
    );
  }

  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool showPass = true; //true：密码样式显示，false：明文显示
  String passInfo = '显示';

  Widget _contentWidget() {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(50)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '手机号/用户名/邮箱',
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
          Container(
            color: Colors.white,
            child: Theme(
              data: ThemeData(primaryColor: Colors.brown),
              child: TextField(
                controller: passController,
                cursorColor: Colors.brown,
                maxLength: 11,
                buildCounter: _counter,
                keyboardType: TextInputType.phone,
                obscureText: showPass,
              ),
            ),
          )
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

  Widget _forgetPass() {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        print('进入设置密码界面 ... ');
        Application.router.navigateTo(context, Routes.forgetPassPage);
      },
      child: Container(
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
        child: Text(
          '忘记密码?',
          style: TextStyle(
              color: Colors.brown,
              fontSize: ScreenUtil().setSp(28),
              fontWeight: FontWeight.w600),
        ),
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
                print('进入到输入邮箱地址界面');
                String phone = phoneController.text;
                String pass = passController.text;

                if (phone.isEmpty || pass.isEmpty) {
                  Toast.show(context, '请输入用户名或密码!');
                  return;
                }
                print('获取到的手机号为:${phone}');
                print('获取到的密码为:${pass}');

                var form = {'identity': phone};
                post(form, servicePath['getSalt']).then((val) {
                  if (val['errCode'] == 0) {
                    String data = val['data'];

                    String md5Pass = generateMd5(
                        '${generateMd5('${phone}${generateMd5(pass)}')}${data}');

                    //登录接口的调用
                    loginByPhoneAndEmail(phone, md5Pass).then((val) {
                      print('登录请求返回结果:${val}');
                      var data;
                      if (val is Map<String, dynamic>) {
                        data = val;
                      } else {
                        data = json.decode(val.toString());
                      }

                      if (data['errCode'] == 0) {
                        Toast.show(context, '登录成功!');
                        Application.router.navigateTo(context, Routes.homePage);
                      } else {
                        Toast.show(context, data['message']);
                      }
                    });
                  } else {
                    Toast.show(context, val['message']);
                  }
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
