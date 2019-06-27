import 'package:copy_station/helper/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class AutoSwipe extends StatelessWidget {
  final List swiperDataList = [
    Image.asset('images/banner_01.png',fit: BoxFit.fill,),
    Image.asset('images/banner_02.png',fit: BoxFit.fill,),
    Image.asset('images/banner_03.png',fit: BoxFit.fill,),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(280),
      width: ScreenUtil().setWidth(Data.width),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {},
            child: swiperDataList[index],
          );
        },
        itemCount: swiperDataList.length,
        pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
                color: Colors.white30,
                activeColor: Colors.white,
                size: 8.0,
                activeSize: 8.0)),
        autoplay: true,
      ),
    );
  }
}
