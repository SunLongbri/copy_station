import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutBDLSPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('关于邦德乐思'),
        backgroundColor: Colors.white,
        leading: _back(context),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          _iconWidget(),
          _contentWidget(),
        ],
      )),
    );
  }

  Widget _iconWidget() {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: 180,
      padding: EdgeInsets.only(top: ScreenUtil().setHeight(170)),
//      child: Image.asset('images/home_icon.png'),
      child: Image.file(File('/sdcard/Download/Stack.png')),
    );
  }

  Widget _contentWidget() {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
      child: Column(
        children: <Widget>[
          Text(
            'BOUNDLESS SPACE',
            style: TextStyle(
                color: Colors.brown, fontSize: ScreenUtil().setSp(30)),
          ),
          Text(
            '邦德乐思空间',
            style: TextStyle(
                color: Colors.brown, fontSize: ScreenUtil().setSp(40)),
          ),
          Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
              child: Text(
                '上海极展网络科技有限公司',
                style: TextStyle(
                    color: Colors.brown, fontSize: ScreenUtil().setSp(30)),
              )),
          Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
              child: Text(
                '指尖上的联合办公平台',
                style: TextStyle(
                    color: Colors.grey, fontSize: ScreenUtil().setSp(35)),
              )),
          Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
              child: Text(
                'www.bdlsspace.cn',
                style: TextStyle(
                    color: Colors.brown, fontSize: ScreenUtil().setSp(30)),
              )),
          Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
              child: Text(
                '  如果您有任何意见或建议，',
                style: TextStyle(
                    color: Colors.grey, fontSize: ScreenUtil().setSp(30)),
              )),
          Container(
            width: ScreenUtil().setWidth(750),
            alignment: Alignment(0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '请发送邮件至',
                  style: TextStyle(
                      color: Colors.grey, fontSize: ScreenUtil().setSp(25)),
                ),
                Text(
                  'crm@bdlsspace.cn',
                  style: TextStyle(
                      color: Colors.brown, fontSize: ScreenUtil().setSp(25)),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
            child: Text(
              'V 3.0.0',
              style: TextStyle(
                  color: Colors.black, fontSize: ScreenUtil().setSp(40)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(250)),
            child: Column(
              children: <Widget>[
                Text(
                  'Powered by Bdls Management',
                  style: TextStyle(
                      color: Colors.grey, fontSize: ScreenUtil().setSp(30)),
                ),
                Text(
                  'Copyright @ All rights reserved',
                  style: TextStyle(
                      color: Colors.grey, fontSize: ScreenUtil().setSp(30)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _back(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.pop(
          context,
        );
      },
      child: Container(
        width: ScreenUtil().setWidth(20),
        height: ScreenUtil().setHeight(20),
        padding: EdgeInsets.all(20),
        child: InkWell(
          child: Image.asset('images/search_back_icon.png'),
        ),
      ),
    );
  }
}
