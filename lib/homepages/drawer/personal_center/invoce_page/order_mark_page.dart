import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderMarkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _back(context),
        title: Text('历史记录'),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          width: ScreenUtil().setWidth(400),
          height: ScreenUtil().setHeight(400),
          child: Column(
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(200),
                height: ScreenUtil().setHeight(200),
                margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
                child: Image.asset('images/invoce_mark_icon.png',),
              ),
              Text(
                '你没有任何申请开票的记录!',
                style: TextStyle(
                    color: Colors.grey, fontSize: ScreenUtil().setSp(30)),
              )
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
