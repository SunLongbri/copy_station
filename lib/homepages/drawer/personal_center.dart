import 'dart:convert';

import 'package:copy_station/routers/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../color.dart';

class PersonalCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: _back(context),
        title: Text('个人中心'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xffeeeeee),
          child: Column(
            children: <Widget>[
              _topWidget(),
              _myCards(context),
              _mySafe(context),
              _mySetting(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topWidget() {
    return Material(
      elevation: 5.0,
      color: Colors.white,
      child: Container(
        width: ScreenUtil().setWidth(750),
        height: ScreenUtil().setHeight(270),
        child: Column(
          children: <Widget>[
            _firstWidget(),
            _secondWidget(),
          ],
        ),
      ),
    );
  }

  Widget _firstWidget() {
    return Container(
      height: ScreenUtil().setHeight(150),
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(30), right: ScreenUtil().setWidth(30)),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: personal_color, width: 1))),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage('images/wechat_test.png'),
            radius: 30,
          ),
          _information(),
        ],
      ),
    );
  }

  Widget _secondWidget() {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(100),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
              alignment: Alignment.center,
              child: _info_column('0.0元', '账户余额'),
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(
                color: personal_color,
              ))),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
              child: _info_column('250颗', '我的邦豆'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _info_column(String title, String content) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                color: Colors.black, fontSize: ScreenUtil().setSp(35)),
          ),
          Text(
            content,
            style:
                TextStyle(color: Colors.grey, fontSize: ScreenUtil().setSp(25)),
          )
        ],
      ),
    );
  }

  Widget _information() {
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '这么好的昵称都有人起',
            style: TextStyle(
                color: Colors.black, fontSize: ScreenUtil().setSp(35)),
          ),
          Text(
            '尚未绑定邮箱',
            style:
                TextStyle(color: Colors.grey, fontSize: ScreenUtil().setSp(25)),
          ),
        ],
      ),
    );
  }

  Widget _myCards(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(25)),
      child: Column(
        children: <Widget>[
          _singleCard(context, 'images/personal_command.png', '我的评价',
              'images/personal_arrow.png'),
          Divider(height: 1, indent: 16, color: Colors.grey),
          _singleCard(context, 'images/personal_vip.png', '我的会员卡',
              'images/personal_arrow.png'),
          Divider(height: 1, indent: 16, color: Colors.grey),
          _singleCard(context, 'images/personal_like.png', '我的收藏',
              'images/personal_arrow.png'),
          Divider(height: 1, indent: 16, color: Colors.grey),
          _singleCard(context, 'images/personal_invoice.png', '我的发票',
              'images/personal_arrow.png'),
          Divider(height: 1, indent: 16, color: Colors.grey),
          _singleCard(context, 'images/personal_apply.png', '我的申请',
              'images/personal_arrow.png'),
        ],
      ),
    );
  }

  Widget _mySafe(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(25)),
      child: Column(
        children: <Widget>[
          _singleCard(context, 'images/personal_pass.png', '支付密码',
              'images/personal_arrow.png'),
          Divider(height: 1, indent: 16, color: Colors.grey),
          _singleCard(context, 'images/personal_wechat.png', '绑定微信',
              'images/personal_arrow.png'),
          Divider(height: 1, indent: 16, color: Colors.grey),
          _singleCard(context, 'images/personal_email.png', '绑定邮箱',
              'images/personal_arrow.png'),
          Divider(height: 1, indent: 16, color: Colors.grey),
          _singleCard(context, 'images/personal_reset.png', '重置密码',
              'images/personal_arrow.png'),
          Divider(height: 1, indent: 16, color: Colors.grey),
          _singleCard(context, 'images/personal_phone.png', '绑定手机',
              'images/personal_arrow.png'),
        ],
      ),
    );
  }

  Widget _mySetting(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(
          top: ScreenUtil().setHeight(25), bottom: ScreenUtil().setHeight(25)),
      child: Column(
        children: <Widget>[
          _singleCard(context, 'images/personal_setting.png', '设置',
              'images/personal_arrow.png'),
          Divider(height: 1, indent: 16, color: Colors.grey),
          _singleCard(context, 'images/home_icon.png', '关于邦德乐思',
              'images/personal_arrow.png'),
        ],
      ),
    );
  }

  Widget _singleCard(BuildContext context, String leadingUrl, String text,
      String trailingUrl) {
    String title = '';
    return Container(
      child: ListTile(
        onTap: () {
          if (leadingUrl.contains('command')) {
            Application.router.navigateTo(context, '/evaluate');
          } else if (leadingUrl.contains('vip')) {
            Application.router.navigateTo(context, '/cart');
          } else if (leadingUrl.contains('like')) {
            Application.router.navigateTo(context, '/collection');
          } else if (leadingUrl.contains('invoice')) {
            Application.router.navigateTo(context, '/invoce');
          } else if (leadingUrl.contains('apply')) {
            Application.router.navigateTo(context, '/myApplication');
          } else if (leadingUrl.contains('email')) {
            Application.router.navigateTo(context, '/bindEmail');
          } else if (leadingUrl.contains('pass')) {
            Application.router.navigateTo(context, '/setPass');
          } else if (leadingUrl.contains('reset')) {
            title = '重置密码';
            String params = jsonEncode(Utf8Encoder().convert(title));
            Application.router
                .navigateTo(context, '/resetPass?title=${params}');
          } else if (leadingUrl.contains('phone')) {
            title = '绑定手机';
            String params = jsonEncode(Utf8Encoder().convert(title));
            Application.router
                .navigateTo(context, '/resetPass?title=${params}');
          } else if (leadingUrl.contains('setting')) {
            Application.router.navigateTo(context, '/setting');
          } else if (leadingUrl.contains('home')) {
            Application.router.navigateTo(context, '/aboutBDLS');
          }
        },
        leading: Container(
          width: ScreenUtil().setWidth(50),
          height: ScreenUtil().setHeight(50),
          child: Image.asset(
            leadingUrl,
            width: ScreenUtil().setWidth(50),
            height: ScreenUtil().setHeight(50),
          ),
        ),
        title: Text(text),
        trailing: Container(
          width: ScreenUtil().setWidth(30),
          height: ScreenUtil().setHeight(30),
          child: Image.asset(
            trailingUrl,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }

  Widget _back(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Application.router.navigateTo(context, '/home');
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
