import 'package:copy_station/routers/application.dart';
import 'package:copy_station/routers/routes.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroView extends StatelessWidget {
  static const length = 3;
  final pageIndexNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    final pages = [
      _indexPage1(),
      _indexPage2(),
      _indexPage3(context),
    ];
    return Scaffold(
      body: Container(
        width: ScreenUtil().setWidth(750),
        height: ScreenUtil().setHeight(1334),
        child: Stack(
          alignment: FractionalOffset.bottomCenter,
          children: <Widget>[
            PageView.builder(
              onPageChanged: (index) => pageIndexNotifier.value = index,
              itemCount: length,
              itemBuilder: (context, index) {
                return Container(
                  child: pages[index],
                );
              },
            ),
            _buildExample1()
          ],
        ),
      ),
    );
  }

  PageViewIndicator _buildExample1() {
    return PageViewIndicator(
      pageIndexNotifier: pageIndexNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
            size: 8.0,
            color: Colors.grey,
          ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
            scale: CurvedAnimation(
              parent: animationController,
              curve: Curves.ease,
            ),
            child: Circle(
              size: 12.0,
              color: Colors.white,
            ),
          ),
    );
  }

  Widget _indexPage1() {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(1334),
      child: Stack(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(750),
            height: ScreenUtil().setHeight(1334),
            child: Image.asset(
              'images/splash_index1.png',
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: FractionalOffset(0.1, 0.8),
            child: Text(
              '资源共享',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(68),
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Align(
            alignment: FractionalOffset(0.1, 0.84),
            child: Text(
              '在邦德乐思空间',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(32),
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: FractionalOffset(0.11, 0.87),
            child: Text(
              '基于网络的资源共享',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(32),
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: FractionalOffset(0.115, 0.9),
            child: Text(
              '把更好的东西带给大家',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(32),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _indexPage2() {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(1334),
      child: Stack(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(750),
            height: ScreenUtil().setHeight(1334),
            child: Image.asset(
              'images/splash_index2.png',
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: FractionalOffset(0.5, 0.6),
            child: index2Text(),
          ),
        ],
      ),
    );
  }

  Widget index2Text() {
    return Container(
      height: ScreenUtil().setHeight(250),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '地域无界',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(68),
                color: Colors.white,
                fontWeight: FontWeight.w500),
          ),
          Text(
            '无论您在哪里无论现在什么时候',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(32),
              color: Colors.white,
            ),
          ),
          Text(
            '邦德乐思空间与您同在',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(32),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _indexPage3(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(1334),
      child: Stack(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(750),
            height: ScreenUtil().setHeight(1334),
            child: Image.asset(
              'images/splash_index3.png',
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: FractionalOffset(0.1, 0.9),
            child: _index3Text(),
          ),
          Align(
            alignment: FractionalOffset(0.9, 0.08),
            child: InkWell(
              onTap: (){
                print('进入注册页面');
                Application.router.navigateTo(context, Routes.registerPage);
              },
              child: Text('登录',style: TextStyle(color: Colors.white,fontSize: ScreenUtil().setSp(32)),),
            ),
          ),
        ],
      ),
    );
  }

  Widget _index3Text() {
    return Container(
      height: ScreenUtil().setHeight(250),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '实效优配',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(68),
                color: Colors.white,
                fontWeight: FontWeight.w500),
          ),
          Text(
            '科学安排，计划工作',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(32),
              color: Colors.white,
            ),
          ),
          Text(
            '邦德乐思空间让您的工作',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(32),
              color: Colors.white,
            ),
          ),
          Text(
            '尽在掌握',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(32),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
