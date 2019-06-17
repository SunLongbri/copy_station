import 'package:city_pickers/city_pickers.dart';
import 'package:copy_station/routers/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../color.dart';

class ShowAddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('快递地址'),
        backgroundColor: Colors.white,
        leading: _back(context),
      ),
      body: Container(
        color: prime_color,
        width: ScreenUtil().setWidth(750),
        height: ScreenUtil().setHeight(1334),
        child: Stack(
          children: <Widget>[
            _single_address_card(),
            Align(
              alignment: FractionalOffset(1, 0),
              child: Container(
                padding:
                    EdgeInsets.only(top: ScreenUtil().setHeight(28), left: 2),
                width: ScreenUtil().setWidth(120),
                height: ScreenUtil().setHeight(120),
                child: Image.asset('images/single_invoce_info_icon.png'),
              ),
            ),
            Positioned(
              child: _bottomWidget(context),
              bottom: 0,
            )
          ],
        ),
      ),
    );
  }

  Widget _bottomWidget(BuildContext context) {
    return InkWell(
      onTap: () async {
        print('点击了新增快递地址按钮');
        Application.router.navigateTo(context, 'addAddress');
      },
      child: Container(
        color: Colors.brown,
        height: ScreenUtil().setHeight(100),
        width: ScreenUtil().setWidth(750),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
              width: ScreenUtil().setWidth(50),
              height: ScreenUtil().setHeight(50),
              child: Image.asset('images/confirm_invoce_add_icon.png'),
            ),
            Text(
              '新增快递地址',
              style: TextStyle(
                  color: Colors.white, fontSize: ScreenUtil().setSp(40)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _single_address_card() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(150),
      child: ListTile(
        leading: Container(
          width: ScreenUtil().setWidth(100),
          height: ScreenUtil().setHeight(200),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: ScreenUtil().setHeight(20),
                    bottom: ScreenUtil().setHeight(10)),
                child: Text(
                  '李白',
                  style: TextStyle(
                      color: Colors.black, fontSize: ScreenUtil().setSp(35)),
                ),
              ),
              Text(
                '浦江镇',
                style: TextStyle(
                    color: Colors.black, fontSize: ScreenUtil().setSp(25)),
              )
            ],
          ),
        ),
        title: Container(
          width: ScreenUtil().setWidth(100),
          height: ScreenUtil().setHeight(100),
          child: Stack(
            children: <Widget>[
              Align(
                  alignment: FractionalOffset(1.0, 0.0),
                  child: Padding(
                    padding: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                    child: Text(
                      '13966666666',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(30)),
                    ),
                  )),
            ],
          ),
        ),
        contentPadding: EdgeInsets.only(right: ScreenUtil().setWidth(1)),
        trailing: Container(
          padding: EdgeInsets.only(
              right: ScreenUtil().setWidth(40),
              top: ScreenUtil().setHeight(40)),
          width: ScreenUtil().setWidth(70),
          height: ScreenUtil().setHeight(70),
          child: Image.asset('images/arrows.png'),
        ),
      ),
    );
  }

  //当还没有快递地址时，显示的界面
  Widget _content() {
    return Container(
      height: ScreenUtil().setHeight(1334),
      alignment: Alignment(0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundImage:
                AssetImage('images/confirm_invoce_address_icon.png'),
            radius: 40,
          ),
          Padding(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
            child: Text(
              '你还没有快递地址，快去添加吧!',
              style: TextStyle(
                  color: Colors.grey, fontSize: ScreenUtil().setSp(35)),
            ),
          )
        ],
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
