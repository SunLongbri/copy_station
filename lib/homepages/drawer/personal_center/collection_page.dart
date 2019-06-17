import 'package:copy_station/homepages/drawer/personal_center/collec_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'collec_tab_page.dart';

class CollectionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('我的收藏'),
        leading: _back(context),
      ),
      body: Container(
        child: Column(

          children: <Widget>[
            CollecTabBar(),
            CollecTabPage(),
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
