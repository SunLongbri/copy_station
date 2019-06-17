import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'city_select_custom_header.dart';

class SelectCityPage extends StatelessWidget {
  String currentCity;

  SelectCityPage(this.currentCity);

  @override
  Widget build(BuildContext context) {
    ///字符串解码
    var list = List<int>();
    jsonDecode(currentCity).forEach(list.add);
    String cityName = Utf8Decoder().convert(list);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(
          '请选择城市',
          style:
              TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(40)),
        ),
        centerTitle: true,
        leading: _back(context),
      ),
      body: CitySelectCustomHeaderRoute(cityName),
    );
  }

  Widget _back(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.pop(context,);
      },
      child: Container(
        width: ScreenUtil().setWidth(20),
        height: ScreenUtil().setHeight(20),
        padding: EdgeInsets.all(20),
        child: InkWell(
          child: Image.asset('images/city_back_icon.png'),
        ),
      ),
    );
  }
}
