import 'package:copy_station/helper/load_geo_square.dart';
import 'package:copy_station/homepages/search_page/search_result_page.dart';
import 'package:copy_station/homepages/search_page/search_tab_bar.dart';
import 'package:copy_station/model/amap_model.dart';
import 'package:copy_station/net/service_method.dart';
import 'package:copy_station/provider/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SearchWorkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var searchProvider = Provider.of<SearchProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff2f2f2),
        leading: _back(context),
        elevation: 0.0,
        title: _titleWidget(),
        titleSpacing: 0.1,
        centerTitle: true,
        actions: <Widget>[_action(searchProvider)],
      ),
      body: Container(
        child: Consumer<SearchProvider>(builder: (context, weather, _) {
          return searchProvider.isSearch ? SearchResultPage() : SearchTabBar();
        }),
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

  TextEditingController searchController;

  Widget _titleWidget() {
    return Container(
      height: ScreenUtil().setHeight(75),
      child: Container(
        margin: EdgeInsets.only(left: ScreenUtil().setWidth(30)),
        child: TextField(
          cursorColor: Colors.grey,
          controller: searchController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '输入您想租用的办公室或社区空间或地点',
            hintStyle: TextStyle(
                fontSize: ScreenUtil().setSp(25),
                color: Colors.grey,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
    );
  }

  Widget _action(searchProvider) {
    return Container(
      alignment: Alignment.center,
      width: ScreenUtil().setWidth(100),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          print('点击了搜索按钮');
          String searchString = searchController.toString().trim();
          getRequest('上海市联航路地铁站').then((val) {
            print('搜索接收到的数据为:${val}');
            AmapModel amapModel = AmapModel.fromJson(val);
            print(amapModel.status);
            if (amapModel.status.trim().toString().contains('1')) {
              print('请求成功!');
              Geocodes geoCodes = amapModel.geocodes[0];
              print('解析到的经纬度坐标为:${geoCodes.location}');
              List<String> data = geoCodes.location.split(',');
              String longitude = data[0];
              String latitude = data[1];
              LoadGeoSquare(1000, double.parse(longitude), double.parse(latitude));
            }
          });
          searchProvider.isSearch = true;
        },
        child: Text(
          '搜索',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
