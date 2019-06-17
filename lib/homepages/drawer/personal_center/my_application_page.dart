import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApplicationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('长租申请'),
        leading: _back(context),
      ),
      body: Center(
        child: Container(
          width: ScreenUtil().setWidth(400),
          height: ScreenUtil().setHeight(400),
          child: Column(
            children: <Widget>[
              Container(

                width: ScreenUtil().setWidth(150),
                height: ScreenUtil().setHeight(150),
                margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
                child: Image.asset('images/my_application_icon.png',),
              ),
              Container(
                alignment: Alignment(0, 0),
                child: Column(
                  children: <Widget>[
                    Text(
                      '立刻申请属于',
                      style: TextStyle(
                          color: Colors.grey, fontSize: ScreenUtil().setSp(35)),
                    ),
                    Text(
                      '自己的办公空间吧!',
                      style: TextStyle(
                          color: Colors.grey, fontSize: ScreenUtil().setSp(35)),
                    ),
                  ],
                )
              ),
            ],
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
