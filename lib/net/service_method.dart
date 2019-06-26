import 'dart:io';
import 'package:copy_station/helper/Toast.dart';
import 'package:copy_station/routers/application.dart';
import 'package:copy_station/routers/routes.dart';
import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart' as fluwx;
import 'package:dio/dio.dart';

import 'service_url.dart';

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

Future loginByPhoneAndEmail(String username, String password) async {
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse('application/x-www-form-urlencoded');
    var formData = {
      'client_id': 'system',
      'client_secret': 'system',
      'grant_type': 'password',
      'scopes': 'app',
      'username': username,
      'password': password,
    };
    response = await dio.post(servicePath['login'], data: formData);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("后端接口出现异常!");
    }
  } catch (e) {
    return print('ERROR: ===============>${e}');
  }
}
