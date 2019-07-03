import 'package:copy_station/helper/data.dart';
import 'package:copy_station/net/service_method.dart';
import 'package:copy_station/net/service_url.dart';
import 'package:copy_station/net/service_wx.dart';
import 'package:copy_station/routers/application.dart';
import 'package:copy_station/routers/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' as H;
import 'package:shared_preferences/shared_preferences.dart';

//登录界面

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    init();
    super.initState();
  }

  SharedPreferences prefs;

  Future init() async {
    prefs = await SharedPreferences.getInstance();
    Data.prefs = prefs;
  }

  @override
  Widget build(BuildContext context) {
    initFluwx();
    return Scaffold(
        appBar: AppBar(
          leading: Text(""),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: <Widget>[
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(right: H.ScreenUtil().setWidth(20)),
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  Application.router.navigateTo(context, '/code');
                },
                child: Text(
                  '注册',
                  style: TextStyle(
                      color: Colors.brown,
                      fontWeight: FontWeight.w500,
                      fontSize: H.ScreenUtil().setSp(38)),
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                left: H.ScreenUtil().setWidth(40),
                top: H.ScreenUtil().setHeight(80)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _iconWidget(),
                _titleWidget(),
                _phoneText(),
                _phoneField(context),
                _iconLogin(context),
                _loginBth(context)
              ],
            ),
          ),
        ));
  }

  Widget _iconWidget() {
    return Container(
      child: Image.asset(
        'images/home_icon.png',
        width: H.ScreenUtil().setWidth(209),
        height: H.ScreenUtil().setHeight(209),
      ),
    );
  }

  Widget _titleWidget() {
    return Container(
      margin: EdgeInsets.only(top: H.ScreenUtil().setHeight(20)),
      child: Text(
        '欢迎来到邦德乐思空间',
        style: TextStyle(
            color: Colors.brown,
            fontWeight: FontWeight.w500,
            fontSize: H.ScreenUtil().setSp(47)),
      ),
    );
  }

  Widget _phoneText() {
    return Container(
      margin: EdgeInsets.only(top: H.ScreenUtil().setHeight(20)),
      child: Text(
        '手机号',
        style: TextStyle(
            color: Colors.brown,
            fontWeight: FontWeight.w600,
            fontSize: H.ScreenUtil().setSp(36)),
      ),
    );
  }

  TextEditingController phoneController = TextEditingController();

  Widget _phoneField(BuildContext context) {
    return Container(
        width: H.ScreenUtil().setWidth(650),
        child: Theme(
          data: ThemeData(primaryColor: Colors.brown),
          child: TextField(
            buildCounter: _counter,
            maxLength: 11,
            cursorColor: Colors.brown,
            keyboardType: TextInputType.phone,
            controller: phoneController,
          ),
        ));
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
//      width: ScreenUtil().setWidth(150),
      margin: EdgeInsets.only(top: H.ScreenUtil().setHeight(10)),
      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            onTap: () {
              String _url =
                  "https://www.easy-mock.com/mock/5c74edefa4b357117cec9ce5/flutter_shop/fluwx_pay";
              print('点击了微信登录 ... ');
              Application.router.navigateTo(context, Routes.homePage);
//              loginByWX(context);
            },
            child: Image.asset(
              'images/register_wechat_icon.png',
              width: H.ScreenUtil().setWidth(61),
              height: H.ScreenUtil().setHeight(50),
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              Application.router.navigateTo(context, Routes.userPassPage);
            },
            child: Padding(
              padding: EdgeInsets.only(left: H.ScreenUtil().setWidth(50)),
              child: Image.asset(
                'images/register_lock_icon.png',
                width: H.ScreenUtil().setWidth(55),
                height: H.ScreenUtil().setHeight(54),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginBth(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        print('开始进入接收手机验证码界面');
        var formData = {'phone': phoneController.text.toString()};
        post(formData, servicePath['sms']).then((val) {
          if (val['errCode'] == 0) {
//            typeProvider.smsState = true;
            print('发送成功');
            String phone = phoneController.text.trim().toString();
            Data.prefs.setString('userPhone', phone);
          } else {
//            typeProvider.smsState = false;
            print('发送失败');
          }
        });
        Application.router.navigateTo(context, Routes.mainCodePage);
      },
      child: Container(
        width: H.ScreenUtil().setWidth(750),
        alignment: Alignment.centerRight,
        margin: EdgeInsets.only(right: H.ScreenUtil().setWidth(45)),
        child: Image.asset(
          'images/arrow.png',
          width: H.ScreenUtil().setWidth(101),
          height: H.ScreenUtil().setHeight(102),
        ),
      ),
    );
  }
}
