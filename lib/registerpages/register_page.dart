import 'package:copy_station/net/service_method.dart';
import 'package:copy_station/net/service_wx.dart';
import 'package:copy_station/routers/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('当前刷新了RegisterPage页面!');
    initFluwx();
    //登录接口的调用
    loginByPhoneAndEmail('htgsuda', '123qwe').then((val) {
      print('请求返回结果:${val}');
    });
    return Scaffold(
      appBar: AppBar(
        leading: Text(""),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                Application.router.navigateTo(context, '/code');
              },
              child: Text(
                '注册',
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(
            left: ScreenUtil().setWidth(40), top: ScreenUtil().setHeight(80)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _iconWidget(),
            _titleWidget(),
            _phoneText(),
            _phoneField(),
            _iconLogin(context)
          ],
        ),
      ),
    );
  }

  Widget _iconWidget() {
    return Container(
      child: Image.asset(
        'images/home_icon.png',
        width: ScreenUtil().setWidth(150),
        height: ScreenUtil().setHeight(150),
      ),
    );
  }

  Widget _titleWidget() {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
      child: Text(
        '欢迎来到邦德乐思空间',
        style: TextStyle(color: Colors.grey, fontSize: ScreenUtil().setSp(48)),
      ),
    );
  }

  Widget _phoneText() {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
      child: Text(
        '手机号',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }

  Widget _phoneField() {
    return Container(
      width: ScreenUtil().setWidth(650),
      child: TextField(
        buildCounter: _counter,
        maxLength: 11,
      ),
    );
  }

  /// TextField 字符统计显示
  Widget _counter(
    BuildContext context, {
    int currentLength,
    int maxLength,
    bool isFocused,
  }) {
    return Container();
  }

  Widget _iconLogin(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: () {
              String _url =
                  "https://www.easy-mock.com/mock/5c74edefa4b357117cec9ce5/flutter_shop/fluwx_pay";
              print('点击了微信登录 ... ');

              loginByWX(context);
            },
            child: Image.asset(
              'images/wechat_icon.png',
              width: ScreenUtil().setWidth(50),
              height: ScreenUtil().setHeight(50),
            ),
          ),
          InkWell(
            onTap: () {
              wechatShareWeb();
            },
            child: Image.asset(
              'images/message_icon.png',
              width: ScreenUtil().setWidth(50),
              height: ScreenUtil().setHeight(50),
            ),
          ),
        ],
      ),
    );
  }

}
