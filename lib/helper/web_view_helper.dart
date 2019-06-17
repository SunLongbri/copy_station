import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:permission_handler/permission_handler.dart';

class WebViewHelper extends StatelessWidget {
  String webUrl;

  WebViewHelper(this.webUrl);

  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  StreamSubscription<WebViewHttpError> _onHttpError;

  @override
  Widget build(BuildContext context) {
    setListener(context, flutterWebviewPlugin);
    var list = List<int>();
    jsonDecode(webUrl).forEach(list.add);
    String url = Utf8Decoder().convert(list);
    return Container(
      color: Colors.white,
      width: 750,
      height: 1334,
      padding: EdgeInsets.only(top: ScreenUtil().setHeight(35)),
      child: WebviewScaffold(
        supportMultipleWindows: true,
        geolocationEnabled: true,
        withJavascript: true,
        withLocalUrl: true,
        scrollBar: false,
        url: url,
//        url: "https://www.siruish.cn/test",
        hidden: true,
        //true:网页未打开之前，默认ProgressBar
        withZoom: true,
        withLocalStorage: true,
//        initialChild: Container(
//          //网页未打开之前，先展示这个widget
//          color: Colors.white,
//          child: const Center(
//            child: Text('Waiting ....  '),
//          ),
//        ),
      ),
    );
  }

  Future<void> requestPermission(PermissionGroup permission) async {
    final List<PermissionGroup> permissions = <PermissionGroup>[permission];
    final Map<PermissionGroup, PermissionStatus> permissionRequestResult =
        await PermissionHandler().requestPermissions(permissions);
  }

  void setListener(context, flutterWebviewPlugin) {
    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      if (url.contains('baidu')) {
        print('监听到网页变化');
        Navigator.of(context).pop();
      }
    });

    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged url) {
      if (url.url.contains('baidu')) {
        print('onStateChanget :  内容为:${url.url}');
//        Navigator.of(context).pop();
      }
    });

    flutterWebviewPlugin.onDestroy.listen((String des) {
      print('onDestroy:页面销毁了：${des}');
    });

    _onHttpError =
        flutterWebviewPlugin.onHttpError.listen((WebViewHttpError error) {
      print('webViewHttpError : ${error}');
    });
  }
}
