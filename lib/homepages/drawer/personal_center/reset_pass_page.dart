import 'dart:convert';

import 'package:copy_station/helper/Toast.dart';
import 'package:copy_station/homepages/drawer/personal_center/timer_button.dart';
import 'package:copy_station/provider/type_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ResetPassPage extends StatelessWidget {
  String title;
  bool isPhone = true;

  ResetPassPage(this.title);

  @override
  Widget build(BuildContext context) {
    var list = List<int>();
    jsonDecode(title).forEach(list.add);
    String titleContent = Utf8Decoder().convert(list);
    print('titleContent:${titleContent}');
    return Scaffold(
      appBar: AppBar(
        title: Text(titleContent),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: <Widget>[
          _topWidget(context),
          Positioned(
            child: _bottomWidget(context),
            bottom: 0,
          ),
        ],
      ),
    );
  }

  Widget _bottomWidget(BuildContext context) {
    var typeProvider = Provider.of<TypeProvider>(context);
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(200),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 1,
                  color: Colors.grey,
                ),
                flex: 1,
              ),
              Expanded(
                child: Container(
                    alignment: Alignment(0, 0),
                    child: Text(
                      '我要用其他方式注册',
                      style: TextStyle(
                          color: Colors.grey, fontSize: ScreenUtil().setSp(35)),
                    )),
                flex: 2,
              ),
              Expanded(
                child: Container(
                  height: 1,
                  color: Colors.grey,
                ),
                flex: 1,
              ),
            ],
          ),
          Container(
            height: ScreenUtil().setHeight(150),
            alignment: Alignment(0, 0),
            child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  isPhone = !isPhone;
                  typeProvider.phoneState = isPhone;
                },
                child: typeProvider.isPhone
                    ? CircleAvatar(
                        radius: 20,
                        child: Icon(
                          Icons.phone_android,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.brown,
                      )
                    : CircleAvatar(
                        radius: 20,
                        child: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.cyan,
                      )),
          ),
        ],
      ),
    );
  }

  Widget _topWidget(BuildContext context) {
    var typeProvider = Provider.of<TypeProvider>(context);
    return Container(
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(20),
          right: ScreenUtil().setWidth(20),
          top: ScreenUtil().setHeight(40),
          bottom: ScreenUtil().setHeight(40)),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
            child: Row(
              children: <Widget>[
                typeProvider.isPhone
                    ? Padding(
                        padding: EdgeInsets.only(
                            top: ScreenUtil().setHeight(20),
                            left: ScreenUtil().setWidth(20),
                            right: ScreenUtil().setWidth(20)),
                        child: Text(
                          '+86',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: ScreenUtil().setSp(30)),
                        ))
                    : Container(),
                Expanded(flex:1,child: _phoneOrEmail(typeProvider)),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: '请输入验证码',
                        labelStyle: TextStyle(decorationColor: Colors.brown)),
                  )),
              Expanded(
                child: TimerButton(),
                flex: 1,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(100)),
            width: ScreenUtil().setWidth(750),
            height: ScreenUtil().setHeight(90),
            child: RaisedButton(
              color: Colors.brown,
              child: Text(
                '提交',
                style: TextStyle(
                    color: Colors.white, fontSize: ScreenUtil().setSp(25)),
              ),
              onPressed: () {
                Toast.show(context, '已经提交...');
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50.0))),
            ),
          ),
        ],
      ),
    );
  }

  Widget _phoneOrEmail(typeProvider){
    return Container(
      height: ScreenUtil().setHeight(100),
      child: TextField(
        decoration: InputDecoration(
          labelText: typeProvider.isPhone ? '手机' : '邮箱',
        ),
      ),
    );
  }
}
