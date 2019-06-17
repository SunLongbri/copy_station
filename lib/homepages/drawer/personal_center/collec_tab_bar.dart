import 'package:copy_station/provider/tab_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CollecTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tabProvider = Provider.of<TabProvider>(context);
    bool isLeft = tabProvider.isLeft;
    bool isRight = tabProvider.isRight;
    print('isLeft:${isLeft},isRight:${isRight}');
    return Container(
      height: ScreenUtil().setHeight(100),
      width: ScreenUtil().setWidth(750),
      child: Row(
        children: <Widget>[
          Expanded(
            child: _myTabBarLeft(tabProvider, isLeft),
            flex: 1,
          ),
          Container(
            width: ScreenUtil().setWidth(2),
            height: ScreenUtil().setHeight(50),
            color: Colors.grey,
          ),
          Expanded(
            child: _myTabBarRight(tabProvider, isRight),
            flex: 1,
          ),
        ],
      ),
    );
  }

  Widget _myTabBarLeft(tabProvider, isLeft) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        print('点击了左侧bar');
        tabProvider.changeLeftAndRight('left');
      },
      child: Container(
//        height: ScreenUtil().setHeight(60),
        alignment: Alignment.center,
        child: Text(
          '社区',
          style: TextStyle(
              color: isLeft ? Colors.brown : Colors.grey,
              fontSize: ScreenUtil().setSp(40)),
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                width: 2, color: isLeft ? Colors.brown : Color(0xffdbdbdb)),
          ),
        ),
      ),
    );
  }

  Widget _myTabBarRight(tabProvider, isRight) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        print('点击了右侧bar');
        tabProvider.changeLeftAndRight('right');
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          '空间',
          style: TextStyle(
              color: isRight ? Colors.brown : Colors.grey,
              fontSize: ScreenUtil().setSp(40)),
        ),
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(
              width: 2, color: isRight ? Colors.brown : Color(0xffdbdbdb)),
        )),
      ),
    );
  }
}
