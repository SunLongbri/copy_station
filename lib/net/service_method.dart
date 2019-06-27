import 'dart:io';
import 'package:dio/dio.dart';
import 'service_url.dart';


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
