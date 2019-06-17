import 'package:copy_station/provider/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SearchTabBar extends StatelessWidget {
  final List<Tab> myTabs = <Tab>[
    Tab(text: '全部'),
    Tab(text: '商圈'),
    Tab(text: '地铁沿线'),
  ];

  @override
  Widget build(BuildContext context) {
    var searchProvider = Provider.of<SearchProvider>(context);
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
            return Container(
                alignment: Alignment.center,
                color: Colors.white,
                child: _historySearch(searchProvider));
          }).toList(),
        ),
      ),
    );
  }

  Widget _historySearch(searchProvider) {
    return Container(
      child: Column(
        children: <Widget>[
          _title(),
          _historyContent(searchProvider),
        ],
      ),
    );
  }

  Widget _title() {
    return Container(
      width: ScreenUtil().setWidth(750),
      margin: EdgeInsets.only(
          top: ScreenUtil().setHeight(50),
          left: ScreenUtil().setWidth(20),
          right: ScreenUtil().setWidth(20),
          bottom: ScreenUtil().setHeight(20)),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              '历史搜索',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil().setSp(40),
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(50),
            height: ScreenUtil().setHeight(50),
            padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(5),
                right: ScreenUtil().setWidth(5)),
            child: InkWell(
              onTap: () {
                print('点击了删除按钮!');
              },
              child: Image.asset('images/search_delect_icon.png'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _historyContent(searchProvider) {
    return Container(
      width: ScreenUtil().setWidth(750),
      margin: EdgeInsets.only(
          left: ScreenUtil().setHeight(10), right: ScreenUtil().setWidth(10)),
      child: Wrap(
        children: <Widget>[
          _singleHistory('徐家汇', searchProvider),
          _singleHistory('联航路地铁站', searchProvider),
          _singleHistory('虹桥', searchProvider),
          _singleHistory('8号线', searchProvider),
          _singleHistory('陆家嘴', searchProvider),
          _singleHistory('人民广场', searchProvider),
          _singleHistory('徐家汇', searchProvider),
          _singleHistory('徐家汇', searchProvider),
          _singleHistory('徐家汇', searchProvider),
        ],
      ),
    );
  }

  Widget _singleHistory(String content, searchProvider) {
    return InkWell(
      onTap: () {
        print('点击了历史搜索  ....  ');
        searchProvider.isSearch = true;
      },
      child: Container(
        margin: EdgeInsets.only(
            left: ScreenUtil().setHeight(10),
            right: ScreenUtil().setWidth(10),
            top: ScreenUtil().setHeight(20)),
        child: Padding(
          padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(20),
              right: ScreenUtil().setWidth(20),
              top: ScreenUtil().setHeight(10),
              bottom: ScreenUtil().setHeight(10)),
          child: Text(
            content,
            style: TextStyle(
                color: Colors.black, fontSize: ScreenUtil().setSp(35)),
          ),
        ),
        decoration: BoxDecoration(
            color: Color(0xfff2f2f2), borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
