import 'package:copy_station/routers/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FuncList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
      child: Column(
        children: <Widget>[
          _singleFunc(context, 'images/drawer_personal_icon.png', '个人中心'),
          _singleFunc(context, 'images/drawer_msg_icon.png', '我的消息'),
          _singleFunc(context, 'images/drawer_order_icon.png', '我的订单'),
          _singleFunc(context, 'images/drawer_shop_icon.png', '邦豆商城'),
        ],
      ),
    );
  }

  Widget _singleFunc(BuildContext context, String imageUrl, String content) {
    return InkWell(
      onTap: () {
        print('点击了侧边栏菜单 ...   ');
        if (imageUrl.contains('personal')) {
          Application.router.navigateTo(context, '/personal');
        }else if(imageUrl.contains('order')){
          Application.router.navigateTo(context, '/myOrder');
        }
      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(ScreenUtil().setWidth(30)),
              child: Image.asset(
                imageUrl,
                width: ScreenUtil().setWidth(50),
                height: ScreenUtil().setHeight(50),
              ),
            ),
            Text(
              content,
              style: TextStyle(
                  color: Colors.brown,
                  fontSize: ScreenUtil().setSp(35),
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
