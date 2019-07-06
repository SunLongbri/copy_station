import 'dart:io';

import 'package:dio/dio.dart';

import 'service_url.dart';

//用户登录
Future loginByPhoneAndEmail(String username, String password) async {
  Response response;
  try {
    Dio dio = new Dio();
//    dio.interceptors.responseLock
    dio.options.contentType =
        ContentType.parse('application/x-www-form-urlencoded');
    var formData = {
      'identity': username,
      'password': password,
    };
    response = await dio.post(servicePath['login'], data: formData);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("后端接口出现异常!");
    }
  } catch (e) {
    print('ERROR: ===============>${e.response}');
    return e.response;
  }
}

//手机号加验证码快速登录
Future codeLogin(formData, String url) async {
  Response response;
  try {
    Dio dio = new Dio();
    dio.options.contentType =
        ContentType.parse('application/x-www-form-urlencoded');
    response = await dio.post(url, data: formData);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("后端接口出现异常!");
    }
  } catch (e) {
    print('ERROR: ===============>${e.response}');
    return e.response;
  }
}

Future post(formData, url) async {
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse('application/json');

    response = await dio.post(url, data: formData);
    if (response.statusCode == 200) {
      print('返回结果:${response.data}');
      return response.data;
    } else {
      throw Exception("后端接口出现异常!");
    }
  } catch (e) {
    return e.response;
  }
}

Future getRequest(paras,url) async {
  try {
    Response response;
    Dio dio = Dio();
    dio.options.contentType = ContentType.parse('application/json');
    dio.options.connectTimeout = 15000;

    String amapUrl = url;
    response = await dio.get(amapUrl, queryParameters: paras);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      print('异常:响应码:${response.statusCode}');
    }
  } catch (e) {
    print('请求抛出异常，异常为:${e}');
  }
}
