import 'package:copy_station/helper/Toast.dart';
import 'package:copy_station/homepages/drawer/personal_center/timer_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BindEmailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('绑定邮箱'),
        leading: _back(context),
      ),
      body: Container(
        margin: EdgeInsets.only(
            left: ScreenUtil().setWidth(20),
            right: ScreenUtil().setWidth(20),
            top: ScreenUtil().setHeight(40),
            bottom: ScreenUtil().setHeight(40)),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
              child: TextField(
                decoration: InputDecoration(
                  labelText: '邮箱地址',
                ),
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
