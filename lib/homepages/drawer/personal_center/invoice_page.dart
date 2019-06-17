import 'package:copy_station/routers/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvocePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('我的发票'),
        leading: _back(context),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _topArea(),
            Divider(height: 1, indent: 16, color: Colors.grey),
            _singleCard(context, '向平台提供发票:', '￥0.00', '申请开票'),
            Divider(height: 1, indent: 16, color: Colors.grey),
            _singleCard(context, '由社区提供发票:', '￥0.00', '申请开票'),
            Container(
              width: ScreenUtil().setWidth(750),
              height: ScreenUtil().setHeight(40),
              color: Color(0xffe2e2e2),
            ),
            _singleCard(context, '发票信息', '', '去新增发票信息'),
            Divider(height: 1, indent: 16, color: Colors.grey),
            _singleCard(context, '快递地址', '', '去新增快递地址'),
            Divider(height: 1, indent: 16, color: Colors.grey),
            _singleCard(context, '历史记录', '', ''),
            Container(width: ScreenUtil().setWidth(750),height: ScreenUtil().setHeight(418),
              color: Color(0xffe2e2e2),
            )
          ],
        ),
      ),
    );
  }

  Widget _topArea() {
    return Container(
      height: ScreenUtil().setHeight(200),
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage('images/wechat_test.png'),
            radius: 35.0,
          ),
          _userInfo(),
        ],
      ),
    );
  }

  Widget _userInfo() {
    return Container(
      height: ScreenUtil().setHeight(110),
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '什么昵称都有人起',
            style: TextStyle(
                color: Colors.black, fontSize: ScreenUtil().setSp(40)),
          ),
          Padding(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
            child: Text(
              '1896666666666',
              style: TextStyle(
                  color: Colors.grey, fontSize: ScreenUtil().setSp(30)),
            ),
          )
        ],
      ),
    );
  }

  Widget _singleCard(
      BuildContext context, String title, String money, String content) {
    return Container(
      child: ListTile(
        onTap: () {
          if (title.contains('平台')) {
            Application.router.navigateTo(context, '/confirmInvoce');
          } else if (title.contains('社区')) {
            Application.router.navigateTo(context, '/invoceInfoMark');
          } else if (title.contains('信息')) {
            Application.router.navigateTo(context, '/invoceInfo');
          } else if (title.contains('快递地址')) {
            Application.router.navigateTo(context, '/showAddress');
          } else if (title.contains('历史记录')) {
            Application.router.navigateTo(context, '/orderMark');
          }
        },
        title: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Text(title),
                      Text(
                        money,
                        style: TextStyle(
                            color: Colors.brown,
                            fontSize: ScreenUtil().setSp(40)),
                      )
                    ],
                  ),
                ),
                flex: 1,
              ),
              Text(
                content,
                style: TextStyle(
                    color: Colors.grey, fontSize: ScreenUtil().setSp(30)),
              ),
            ],
          ),
        ),
        trailing: Container(
          width: ScreenUtil().setWidth(30),
          height: ScreenUtil().setHeight(30),
          child: Image.asset(
            'images/personal_arrow.png',
            fit: BoxFit.fitHeight,
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
