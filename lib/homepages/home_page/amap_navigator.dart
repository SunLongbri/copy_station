import 'package:copy_station/helper/data.dart';
import 'package:copy_station/homepages/home_page/single_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Amap_Navigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double containerHeight = 0;
    double setHeight = 0;
    if (Data.height > 1919 && Data.height <= 1920) {
      containerHeight = 460;
      setHeight = 210;
    } else {
      containerHeight = 410;
      setHeight = 188;
    }
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(containerHeight),
      child: StaggeredGridView.count(
        controller: ScrollController(keepScrollOffset: false),
        crossAxisCount: 3,
        crossAxisSpacing: ScreenUtil().setWidth(10),
        mainAxisSpacing: ScreenUtil().setWidth(10),
        staggeredTiles: [
          StaggeredTile.extent(1, ScreenUtil().setHeight(setHeight)),
          StaggeredTile.extent(1, ScreenUtil().setHeight(setHeight)),
          StaggeredTile.extent(1, ScreenUtil().setHeight(setHeight)),
          StaggeredTile.extent(1, ScreenUtil().setHeight(setHeight)),
          StaggeredTile.extent(1, ScreenUtil().setHeight(setHeight)),
          StaggeredTile.extent(1, ScreenUtil().setHeight(setHeight)),
        ],
        padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(15),
            left: ScreenUtil().setWidth(10),
            right: ScreenUtil().setWidth(10)),
        children: <Widget>[
          SingleNavigator(
              'images/navigator1.png', '教育培训', 'Education and training'),
          SingleNavigator('images/navigator2.png', '会议室', 'The meeting room'),
          SingleNavigator('images/navigator3.png', '工位', 'Station'),
          SingleNavigator('images/navigator4.png', '办公室', 'The office room'),
          SingleNavigator(
              'images/navigator5.png', '休闲空间', 'Recreational space'),
          SingleNavigator('images/navigator6.png', '其他', 'Others'),
        ],
      ),
    );
  }
}
