import 'package:copy_station/helper/Toast.dart';
import 'package:copy_station/helper/wechat_helper.dart';
import 'package:copy_station/net/service_method.dart';
import 'package:copy_station/routers/application.dart';
import 'package:copy_station/routers/routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluwx/fluwx.dart' as fluwx;
import 'package:tobias/tobias.dart' as tobias;

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

  _aliPay() async {
    var result = await tobias.isAliPayInstalled();
    print('支付宝客户端是否安装:${result}');
  }

  _pay(_url) async {
    fluwx.responseFromPayment.listen((data) {
      print(
          'data.extData : ${data.extData} data.errCode : ${data.errCode}  data.errStr : ${data.errStr}');
    });
    var result = await postHttp(_url);
    print('返回来的结果为:${result}');
    print(result['appid']);
    print(result["timestamp"]);
    fluwx
        .pay(
      appId: result['appid'].toString(),
      partnerId: result['partnerid'].toString(),
      prepayId: result['prepayid'].toString(),
      packageValue: result['package'].toString(),
      nonceStr: result['noncestr'].toString(),
      timeStamp: result['timestamp'],
      sign: result['sign'].toString(),
//      appId: 'wxd930ea5d5a258f4f',
//      partnerId: '1900000109',
//      prepayId: '1101000000140415649af9fc314aa427',
//      packageValue: 'Sign=WXPay',
//      nonceStr: '1101000000140429eb40476f8896f4c9',
//      timeStamp: 1398746574,
//      sign: '7FFECB600D7157C5AA49810D2D8F28BC2811827B',
    )
        .then((data) {
      print("---》$data");
    });
  }

  Future postHttp(String url) async {
    try {
      Response response;
      //get请求:https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian
      response = await Dio().post(url);
      return response.data;
    } catch (e) {
      return print(e);
    }
  }
}
