import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ShowStation extends StatelessWidget {
  final swiperDataList = [
    'images/drawer_swiper1.png',
    'images/drawer_swiper2.png',
    'images/drawer_swiper3.png',
    'images/drawer_swiper4.png',
    'images/drawer_swiper5.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(20), right: ScreenUtil().setWidth(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '办公园展示',
            style: TextStyle(
                color: Colors.brown, fontSize: ScreenUtil().setSp(35)),
          ),
          Container(
            height: ScreenUtil().setHeight(250),
            width: ScreenUtil().setWidth(595),
            margin: EdgeInsets.only(
                top: ScreenUtil().setHeight(20),
                bottom: ScreenUtil().setHeight(20)),
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
//                  Application.router.navigateTo(
//                      context, '/detail?id=${swiperDateList[index]['goodsId']}');
                  },
                  child: Image.asset(
                    swiperDataList[index],
                    fit: BoxFit.fill,
                  ),
                );
              },
              itemCount: 5,
              pagination: SwiperPagination(
                  alignment: Alignment(1.0, 1.0),
                  builder: DotSwiperPaginationBuilder(
                      color: Colors.white30,
                      activeColor: Colors.white,
                      size: 7.0,
                      activeSize: 7.0)),
              autoplay: true,
            ),
          ),
        ],
      ),
    );
  }
}
