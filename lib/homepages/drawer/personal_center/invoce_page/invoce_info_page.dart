import 'package:copy_station/homepages/drawer/personal_center/invoce_page/single_invoce_info.dart';
import 'package:copy_station/routers/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../color.dart';

class InvoceInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发票信息'),
        backgroundColor: Colors.white,
        leading: _back(context),
      ),
      body: Container(
        color: prime_color,
        width: ScreenUtil().setWidth(750),
        height: ScreenUtil().setHeight(1334),
        child: Stack(
          children: <Widget>[
            SingleInvoceInfo(),
            Positioned(
              child: _bottomWidget(context),
              bottom: 0,
            )
          ],
        ),
      ),
    );
  }

  //如果当前页面中，用户没有存储发票信息的展示页面
  Widget _content() {
    return Container(
      height: ScreenUtil().setHeight(1334),
      alignment: Alignment(0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(150),
            child: Image.asset('images/invoce_info_icon.png'),
          ),
          Padding(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
            child: Text(
              '你还没有发票信息，快去添加吧!',
              style: TextStyle(
                  color: Colors.grey, fontSize: ScreenUtil().setSp(35)),
            ),
          )
        ],
      ),
    );
  }

  Widget _bottomWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        print('点击了新增发票信息按钮');
        _showInvoceInfoDialog(context).then((val) {
          print('用户点击了：${val}');
          if (val.contains('普通')) {
            Application.router.navigateTo(context, '/invoceInfoCommon');
          } else if (val.contains('专用')) {
            Application.router.navigateTo(context, '/invoceInfoSpecial');
          }
        });
      },
      child: Container(
        color: Colors.brown,
        height: ScreenUtil().setHeight(100),
        width: ScreenUtil().setWidth(750),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
              width: ScreenUtil().setWidth(50),
              height: ScreenUtil().setHeight(50),
              child: Image.asset('images/confirm_invoce_add_icon.png'),
            ),
            Text(
              '新增发票信息',
              style: TextStyle(
                  color: Colors.white, fontSize: ScreenUtil().setSp(40)),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> _showInvoceInfoDialog(BuildContext context) async {
    var result = await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            titlePadding: EdgeInsets.only(
                left: ScreenUtil().setWidth(150),
                top: ScreenUtil().setHeight(30)),
            title: Container(
              child: Text('新增发票信息'),
            ),
            children: <Widget>[
              Divider(indent: 1, color: Colors.grey),
              SimpleDialogOption(
                child: Container(
                    padding: EdgeInsets.only(left: ScreenUtil().setWidth(100)),
                    child: Text(
                      '增值税普通发票',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(35)),
                    )),
                onPressed: () {
                  Navigator.pop(context, '增值税普通发票');
                },
              ),
              Divider(indent: 1, color: Colors.grey),
              SimpleDialogOption(
                child: Padding(
                    padding: EdgeInsets.only(left: ScreenUtil().setWidth(100)),
                    child: Text(
                      '增值税专用发票',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(35)),
                    )),
                onPressed: () {
                  Navigator.pop(context, '增值税专用发票');
                },
              ),
            ],
          );
        });
    return result == null ? '未选择发票类型' : result;
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
