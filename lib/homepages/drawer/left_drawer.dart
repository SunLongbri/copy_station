import 'package:copy_station/homepages/drawer/func_list.dart';
import 'package:copy_station/homepages/drawer/show_station.dart';
import 'package:copy_station/homepages/drawer/top_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Drawer buildDrawer() {
  return Drawer(
    child: Container(
      height: ScreenUtil().setHeight(1334),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              TopLogin(),
              FuncList(),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: ShowStation(),
          ),
        ],
      ),
    ),
  );
}
