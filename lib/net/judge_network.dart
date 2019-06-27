import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:copy_station/provider/type_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

judgeNetWork(BuildContext context) async {
  TypeProvider typeProvider = Provider.of<TypeProvider>(context);
  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  //平台消息可能会失败，因此我们使用Try/Catch PlatformException。
  try {
    _connectionStatus = (await _connectivity.checkConnectivity()).toString();
  } on PlatformException catch (e) {
    print(e.toString());
    _connectionStatus = 'Failed to get connectivity.';
  }

  print('connectionStatus:${_connectionStatus.toString()}');

  _connectivitySubscription =
      _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
    print('当前的网络状态：${result.toString()}');
    if (result.toString().contains('wifi') ||
        result.toString().contains('mobile')) {
      //当前网络通常
      typeProvider.netError = false;
    } else {
      //当前网络异常
      typeProvider.netError = true;
    }
  });
}
