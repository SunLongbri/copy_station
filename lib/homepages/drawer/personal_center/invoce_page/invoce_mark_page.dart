import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvoceMarkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _back(context),
        backgroundColor: Colors.white,
        title: Text('其他未开发票'),
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
                child: Image.asset('images/uninvoce_icon.png'),
              ),
              Text(
                '暂时没有可开发票哦!',
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
