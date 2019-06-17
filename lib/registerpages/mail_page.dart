import 'package:copy_station/routers/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.brown,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: ScreenUtil().setWidth(750),
        height: ScreenUtil().setHeight(1334),
        margin: EdgeInsets.only(left: ScreenUtil().setWidth(40),top: ScreenUtil().setHeight(40),right: ScreenUtil().setWidth(40)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _titleWidget(),
            _fieldWidget(),
            _arrowWidget(context)
          ],
        ),
      ),
    );
  }

  Widget _titleWidget() {
    return Container(
      child: Text(
        '请输入邮箱地址',
        style: TextStyle(color: Colors.brown, fontSize: ScreenUtil().setSp(48)),
      ),
    );
  }

  Widget _fieldWidget() {
    return Container(
      child: TextField(),
    );
  }

  Widget _arrowWidget(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(80),
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: FractionalOffset(1.0, 0.5),
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                print('进入到输入邮箱地址界面');
                Application.router.navigateTo(context, '/home');
              },
              child: Image.asset(
                'images/arrow.png',
                width: ScreenUtil().setWidth(80),
                height: ScreenUtil().setHeight(80),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
