import 'package:copy_station/provider/tab_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../color.dart';
import 'collec_tab_left.dart';
import 'collec_tab_right.dart';

class CollecTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tabProvider = Provider.of<TabProvider>(context);
    bool isLeft = tabProvider.isLeft;
    return Container(
      color: prime_color,
      height: ScreenUtil().setHeight(1085),
      child: Container(
        alignment: Alignment.topLeft,
        child: isLeft ? CollecTabLeft() : CollecTabRight(),
      ),
    );
  }

  Widget _leftPage() {
    return Container(
      alignment: Alignment.center,
      child: Container(
        height: ScreenUtil().setHeight(150),
        child: Column(
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(80),
              height: ScreenUtil().setHeight(100),
              child: Image.asset('images/collec_icon.png'),
            ),
            Text('你还没有收藏的社区呦!'),
          ],
        ),
      ),
    );
  }



  Widget _rightPage() {
    return Container(
      alignment: Alignment.center,
      child: Container(
        height: ScreenUtil().setHeight(150),
        child: Column(
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(80),
              height: ScreenUtil().setHeight(100),
              child: Image.asset('images/collec_icon.png'),
            ),
            Text('你还没有收藏的空间呦!'),
          ],
        ),
      ),
    );
  }
}
