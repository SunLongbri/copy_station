import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('我的会员卡'),
        leading: _back(context),
      ),
      body: Center(
        child: Container(
          height: ScreenUtil().setHeight(200),
          child: Column(
            children: <Widget>[
              Container(
                child: Image.asset('images/personal_no_cart.png'),
                width: ScreenUtil().setWidth(100),
                height: ScreenUtil().setHeight(100),
              ),
              Text(
                '您还没有会员卡',
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
