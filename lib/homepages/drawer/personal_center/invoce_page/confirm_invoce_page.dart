import 'package:copy_station/helper/Toast.dart';
import 'package:copy_station/provider/type_provider.dart';
import 'package:copy_station/routers/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:copy_station/helper/color.dart';
import 'message_dialog.dart';

class ConfirmInvocePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var typeProvider = Provider.of<TypeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('确认开票'),
          leading: _back(context),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              color: Color(0xffe2e2e2),
              child: Column(
                children: <Widget>[
                  _singleCard(context, '添加快递信息', '', true),
                  _title(),
                  _invoceMoney(context, '开票金额', '可开金额￥0.00', false),
                  Divider(height: 1, indent: 16, color: Colors.grey),
                  _singleCard(context, '开票科目', typeProvider.moneyTpye, true),
                  Divider(height: 1, indent: 16, color: Colors.grey),
                  _singleCard(context, '发票信息', '', true),
                  _info(),
                ],
              ),
            ),
            Positioned(
              child: _confirmBtn(context),
              bottom: 0,
            )
          ],
        ));
  }

  Widget _confirmBtn(BuildContext context) {
    return InkWell(
        onTap: () {
          print('点击了确认开票按钮!');
          Toast.show(context, '请先填写信息!');
        },
        child: Container(
            color: Colors.white,
            width: ScreenUtil().setWidth(750),
            height: ScreenUtil().setHeight(100),
            child: Container(
              alignment: Alignment(0, 0),
              margin: EdgeInsets.only(
                  left: ScreenUtil().setWidth(20),
                  right: ScreenUtil().setWidth(20),
                  top: ScreenUtil().setHeight(10),
                  bottom: ScreenUtil().setHeight(10)),
              child: Text(
                '确认开票',
                style: TextStyle(
                    color: Colors.white, fontSize: ScreenUtil().setSp(45)),
              ),
              decoration: BoxDecoration(
                  color: Colors.brown,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
            )));
  }

  Widget _info() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(30),
          right: ScreenUtil().setWidth(30),
          top: ScreenUtil().setHeight(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '为了保护地球，减少纸张浪费。',
            style:
                TextStyle(color: Colors.grey, fontSize: ScreenUtil().setSp(30)),
          ),
          Text(
            '我们暂不支持索取100元一下金额的发票,请尽可能合并开票,谢谢您的支持。',
            style:
                TextStyle(color: Colors.grey, fontSize: ScreenUtil().setSp(30)),
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return Container(
        alignment: Alignment.centerLeft,
        color: Colors.white,
        margin: EdgeInsets.only(
            top: ScreenUtil().setHeight(20), bottom: ScreenUtil().setHeight(5)),
        height: ScreenUtil().setHeight(100),
        width: ScreenUtil().setWidth(750),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(30)),
              child: Text(
                '由',
                style: TextStyle(
                    color: Colors.grey, fontSize: ScreenUtil().setSp(30)),
              ),
            ),
            Text(
              '平台',
              style: TextStyle(
                  color: Colors.brown,
                  fontSize: ScreenUtil().setSp(32),
                  fontWeight: FontWeight.w400),
            ),
            Text(
              '提供发票',
              style: TextStyle(
                  color: Colors.grey, fontSize: ScreenUtil().setSp(30)),
            ),
          ],
        ));
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

  Widget _singleCard(
      BuildContext context, String title, String content, bool arrow) {
    return Container(
      color: Colors.white,
      child: ListTile(
        onTap: () {
          if (title.contains('开票科目')) {
            showDialog<Null>(
              context: context,
              builder: (BuildContext context) {
                return MessageDialog(
                    title: '标题',
                    message: '对话框内容',
                    onCloseEvent: () {
                      print('关闭中 ... ');
                    });
              },
            );
          } else if (title.contains('发票信息')) {
            Application.router.navigateTo(context, '/invoceInfo');
          } else if (title.contains('添加快递信息')) {
            Application.router.navigateTo(context, '/showAddress');
          } else if (title.contains('invoice')) {
            Application.router.navigateTo(context, '/invoce');
          }
        },
        title: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: title.contains("快递信息")
                    ? _addressContent()
                    : Container(
                        child: Text(title),
                      ),
                flex: 1,
              ),
              Text(
                content,
                style: TextStyle(
                    color: Colors.grey, fontSize: ScreenUtil().setSp(30)),
              ),
            ],
          ),
        ),
        trailing: Container(
          width: ScreenUtil().setWidth(30),
          height: ScreenUtil().setHeight(30),
          alignment: Alignment(0, 0),
          child: arrow
              ? Image.asset(
                  'images/personal_arrow.png',
                  fit: BoxFit.fitHeight,
                )
              : Container(),
        ),
      ),
    );
  }

  Widget _addressContent() {
    return Container(
      width: ScreenUtil().setWidth(100),
      height: ScreenUtil().setHeight(150),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(10),bottom: ScreenUtil().setHeight(10)),
                child: Text(
                  '收件人：李白',
                  style: TextStyle(
                      color: Colors.black, fontSize: ScreenUtil().setSp(35)),
                ),
              ),
              Text(
                '快递地址:上海市闵行区浦江镇',
                style: TextStyle(
                    color: Colors.black, fontSize: ScreenUtil().setSp(30)),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _invoceMoney(
      BuildContext context, String title, String content, bool arrow) {
    return Container(
      color: Colors.white,
      child: ListTile(
        title: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Text(title),
                ),
                flex: 1,
              ),
              Container(
                width: ScreenUtil().setWidth(220),
                height: ScreenUtil().setHeight(50),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: content,
                      hintStyle: TextStyle(
                          color: Colors.grey, fontSize: ScreenUtil().setSp(30)),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.only(top: ScreenUtil().setHeight(20))),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
        trailing: Container(
          width: ScreenUtil().setWidth(30),
          height: ScreenUtil().setHeight(30),
          child: arrow
              ? Image.asset(
                  'images/personal_arrow.png',
                  fit: BoxFit.fitHeight,
                )
              : Container(),
        ),
      ),
    );
  }
}
