import 'package:copy_station/homepages/search_page/search_result_page.dart';
import 'package:copy_station/homepages/search_page/search_tab_bar.dart';
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

  Widget _titleWidget() {
    return Container(
      height: ScreenUtil().setHeight(75),
      child: Container(
        margin: EdgeInsets.only(left: ScreenUtil().setWidth(30)),
        child: TextField(
          cursorColor: Colors.grey,
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
