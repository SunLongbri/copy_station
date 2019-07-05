import 'dart:convert';

import 'package:copy_station/helper/Toast.dart';
import 'package:copy_station/model/housing_model.dart';
import 'package:copy_station/provider/type_provider.dart';
import 'package:copy_station/routers/application.dart';
import 'package:copy_station/routers/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class StationInfo extends StatelessWidget {
  final Rows rows;

  const StationInfo({Key key, this.rows}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TypeProvider typeProvider = Provider.of<TypeProvider>(context);
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        if (typeProvider.netError == true) {
          Toast.show(context, '请检查你的网络链接');
          return;
        }
        print('访问房间详情页面 ... ');
        String url = "http://192.168.1.116:8080/detailItem?id=1";
        var json = jsonEncode(Utf8Encoder().convert(url));
//        Application.router.navigateTo(
//            context, '${Routes.webViewHelper}?weburl=$json');
        Application.router
            .navigateTo(context, '${Routes.webViewFlutter}?weburl=$json');
      },
      child: Container(
        width: ScreenUtil().setWidth(750),
        margin: EdgeInsets.only(
            bottom: ScreenUtil().setHeight(25),
            top: ScreenUtil().setHeight(15)),
        child: Column(
          children: <Widget>[_titlePic(), _detail()],
        ),
      ),
    );
  }

  Widget _titlePic() {
    return Container(
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(20), right: ScreenUtil().setWidth(20)),
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(300),
      child: Image.network(
        rows.masterImg,
        width: ScreenUtil().setWidth(750),
        height: ScreenUtil().setHeight(300),
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _detail() {
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(5),
                bottom: ScreenUtil().setHeight(5)),
            child: Text(
              '${rows.gardenName}'
              ,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(30),
                  color: Color(0xFF5A412E),
                  fontWeight: FontWeight.w400),
            ),
          ),
          Text('${rows.housingName}',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(32),
                  color: Colors.brown,
                  fontWeight: FontWeight.bold)),
          Row(
            children: <Widget>[
              Text(
                '${rows.price.split('/')[0]}元起',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(26),
                    color: Colors.brown,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                child: Text(
                  '面积：${rows.area}㎡   容纳：${rows.station}人',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(26),
                      color: Color(0xFF5A412E),
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
