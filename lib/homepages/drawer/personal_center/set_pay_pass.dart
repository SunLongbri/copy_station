import 'package:copy_station/helper/data.dart';
import 'package:copy_station/homepages/drawer/payboard/keyboard_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetPayPassPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Data.safePayNum ++;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('邦德乐思空间'),
        leading: _back(context),
      ),
      body: Container(
        child: main_keyboard(),
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
