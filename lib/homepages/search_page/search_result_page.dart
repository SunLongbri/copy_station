import 'package:copy_station/homepages/home_page/station_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchResultPage extends StatelessWidget {
  final List<Tab> myTabs = <Tab>[
    Tab(text: '价格'),
    Tab(text: '面积'),
    Tab(text: '距离'),
    Tab(text: '评价'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: myTabs.length,
        child: Scaffold(
          backgroundColor: Color(0xfff2f2f2),
          appBar: TabBar(
            unselectedLabelColor: Colors.brown,
            labelColor: Colors.brown,
            indicatorColor: Colors.brown,
            tabs: myTabs,
            isScrollable: false,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.only(
              bottom: ScreenUtil().setWidth(20),
            ),
          ),
          body: TabBarView(
            children: myTabs.map((Tab tab) {
              return SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.only(top: ScreenUtil().setHeight(25)),
                    alignment: Alignment.center,
                    color: Colors.white,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
//                          StationInfo(),
//                          StationInfo(),
//                          StationInfo(),
//                          StationInfo(),
                        ],
                      ),
                    )),
              );
            }).toList(),
          ),
        ));
  }
}
