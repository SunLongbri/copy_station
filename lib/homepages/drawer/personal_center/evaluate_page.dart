import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../color.dart';

class EvaluatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('我的评价'),
        leading: _back(context),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              _singleComment(),
              _singleComment(),
              _singleComment(),
              _singleComment(),
              _singleComment(),
              _singleComment(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _singleComment() {
    return Padding(
      padding: EdgeInsets.only(left: 5, right: 5, top: 10,bottom: 5),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10.0),
          topLeft: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
        child: Container(
          margin: EdgeInsets.all(ScreenUtil().setWidth(20)),
//          height: ScreenUtil().setHeight(300),
          child: Column(
            children: <Widget>[
              _titleWidget(),
              _commentWidget(),
              _contentWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleWidget() {
    return Container(
      margin: EdgeInsets.all(ScreenUtil().setWidth(20)),
      child: Row(
        children: <Widget>[
          _headImage(),
          Expanded(
            child: _nameWidget(),
            flex: 1,
          ),
          _timeWidget()
        ],
      ),
    );
  }

  Widget _headImage() {
    return Container(
      child: CircleAvatar(
        backgroundImage: AssetImage(
          'images/wechat_test.png',
        ),
        radius: 20,
      ),
    );
  }

  Widget _nameWidget() {
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
      child: Column(
//        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('这么好的昵称都有人起'),
          Text('★★★★★★'),
        ],
      ),
    );
  }

  Widget _timeWidget() {
    return Container(
      alignment: Alignment.topRight,
      width: ScreenUtil().setWidth(100),
      height: ScreenUtil().setHeight(80),
      child: Text('5-21'),
    );
  }

  Widget _commentWidget() {
    return Container(
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(20), bottom: ScreenUtil().setHeight(20)),
      alignment: Alignment.centerLeft,
      child: Text('此处省略好多评论 ... '),
    );
  }

  Widget _contentWidget() {
    return Container(
      color: prime_color,
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(20), right: ScreenUtil().setWidth(20)),
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(70),
            height: ScreenUtil().setHeight(70),
            child: Image.asset('images/home_icon.png'),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
              alignment: Alignment.centerLeft,
              child: Column(
                children: <Widget>[
                  Text('name'),
                  Text('address'),
                ],
              ),
            ),
            flex: 1,
          ),
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
