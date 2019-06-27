import 'package:copy_station/helper/Toast.dart';
import 'package:copy_station/routers/application.dart';
import 'package:copy_station/routers/routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart' as fluwx;

//微信appId初始化
initFluwx() async {
  await fluwx.register(appId: "wx8eaa46b891bb15c5");
}

loginByWX(BuildContext context) async {
  var isInstalled = await fluwx.isWeChatInstalled();
  print('微信是否安装:${isInstalled}');
  fluwx.responseFromAuth.listen((data) {
    print(
        '监听到微信登录的结果为:${data.code},errorCode is :${data.errCode} ,errorStr is :${data.errStr}');
    if (data.errCode == 0) {
      Application.router.navigateTo(context, Routes.homePage);
      Toast.show(context, '登录成功!');
    } else if (data.errCode == -4) {
      Toast.show(context, '用户已拒绝!');
    }
  });
  fluwx.sendAuth(scope: 'snsapi_userinfo', state: 'wechat_sdk_demo_test');
}

//微信分享网页
wechatShareWeb() async {
  var model = fluwx.WeChatShareWebPageModel(
      webPage: "https://www.baidu.com",
      title: "下方的人什么都会，不信你点进去看看。",
      thumbnail: "assets://images/my_icon.png",
      scene: fluwx.WeChatScene.SESSION,
      transaction: "hh");
  fluwx.share(model);
}

//支付宝付款代码
pay(_url) async {
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