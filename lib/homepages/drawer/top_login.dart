import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(700),
      height: ScreenUtil().setHeight(300),
      color: Colors.brown,
      child: Row(
        children: <Widget>[
          _circleImage(),
          _text(),
        ],
      ),
    );
  }

  Widget _circleImage(){
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(30),top: ScreenUtil().setHeight(40)),
      child: CircleAvatar(
        backgroundImage: AssetImage('images/wechat_test.png'),
        radius: 30.0,
      ),
    );
  }

  Widget _text(){
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(40),top: ScreenUtil().setHeight(40)),
      child: Text('登录/注册',style: TextStyle(color: Colors.white,fontSize: ScreenUtil().setSp(40),fontWeight: FontWeight.w500),),
    );
  }
}
