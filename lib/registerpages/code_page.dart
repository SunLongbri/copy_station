import 'package:copy_station/routers/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CodePage extends StatelessWidget {
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
        margin: EdgeInsets.only(
            top: ScreenUtil().setHeight(50),
            left: ScreenUtil().setWidth(30),
            right: ScreenUtil().setWidth(30)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _titleWidget(),
            _contentWidget(),
            _arrowWidget(context)
          ],
        ),
      ),
    );
  }

  Widget _titleWidget() {
    return Container(
      child: Text(
        '请输入验证码',
        style: TextStyle(
            color: Colors.brown,
            fontSize: ScreenUtil().setSp(48),
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _contentWidget() {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '我们向你的手机发送了一个验证码',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
            child: Text(
              '请在下方输入',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          TextField(
            maxLength: 6,
            buildCounter: _counter,
          )
        ],
      ),
    );
  }

  Widget _counter(
    BuildContext context, {
    int currentLength,
    int maxLength,
    bool isFocused,
  }) {
    return Container();
  }

  Widget _arrowWidget(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(80),
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: FractionalOffset(1.0, 0.5),
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                print('进入到输入邮箱地址界面');
                Application.router.navigateTo(context, '/mail');
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
