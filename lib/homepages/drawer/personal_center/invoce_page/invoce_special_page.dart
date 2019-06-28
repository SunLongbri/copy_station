import 'package:copy_station/helper/Toast.dart';
import 'package:copy_station/provider/type_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:copy_station/helper/color.dart';

class InvoceSpecialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var typeProvider = Provider.of<TypeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: _back(context),
        title: Text('增值税专用发票'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: bg_color,
            child: Column(
              children: <Widget>[
                _company(),
                Divider(
                  indent: 10,
                  color: Colors.grey,
                  height: ScreenUtil().setHeight(2),
                ),
                _taxNumber(),
                Divider(
                  indent: 10,
                  color: Colors.grey,
                  height: ScreenUtil().setHeight(2),
                ),
                _bankName(),
                Divider(
                  indent: 10,
                  color: Colors.grey,
                  height: ScreenUtil().setHeight(2),
                ),
                _bankNum(),
                Divider(
                  indent: 10,
                  color: Colors.grey,
                  height: ScreenUtil().setHeight(2),
                ),
                _registerAddress(),
                Divider(
                  indent: 10,
                  color: Colors.grey,
                  height: ScreenUtil().setHeight(2),
                ),
                _registerPhone(),
                Divider(
                  indent: 10,
                  color: Colors.grey,
                  height: ScreenUtil().setHeight(2),
                ),
                _default(typeProvider),
                _info(),
              ],
            ),
          ),
          Positioned(child: _confirmBtn(context,typeProvider),bottom: 0,)
        ],
      ),
    );
  }

  Widget _company() {
    return Container(
      color: Colors.white,
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(100),
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(20), right: ScreenUtil().setWidth(20)),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              '公司抬头',
              style: TextStyle(
                  color: Colors.black, fontSize: ScreenUtil().setSp(33)),
            ),
            flex: 1,
          ),
          Expanded(
            child: TextField(
              textAlign: TextAlign.end,
              cursorColor: Colors.brown,
              decoration: InputDecoration(
                  hintText: '请填写公司抬头',
                  hintStyle: TextStyle(fontSize: ScreenUtil().setSp(30)),
                  border: InputBorder.none),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _taxNumber() {
    return Container(
      color: Colors.white,
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(100),
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(20), right: ScreenUtil().setWidth(20)),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              '税务登记号',
              style: TextStyle(
                  color: Colors.black, fontSize: ScreenUtil().setSp(33)),
            ),
            flex: 1,
          ),
          Expanded(
            child: TextField(
              cursorColor: Colors.brown,
              textAlign: TextAlign.end,
              decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: ScreenUtil().setSp(25)),
                  hintText: '请填写税务登记证上的编号',
                  border: InputBorder.none),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _bankName() {
    return Container(
      color: Colors.white,
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(100),
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(20), right: ScreenUtil().setWidth(20)),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              '基本开户银行名称',
              style: TextStyle(
                  color: Colors.black, fontSize: ScreenUtil().setSp(33)),
            ),
            flex: 2,
          ),
          Expanded(
            child: TextField(
              cursorColor: Colors.brown,
              textAlign: TextAlign.end,
              decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: ScreenUtil().setSp(25)),
                  hintText: '请填写开户许可证上的开户银行',
                  border: InputBorder.none),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _bankNum() {
    return Container(
      color: Colors.white,
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(100),
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(20), right: ScreenUtil().setWidth(20)),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              '基本开户账号',
              style: TextStyle(
                  color: Colors.black, fontSize: ScreenUtil().setSp(33)),
            ),
            flex: 1,
          ),
          Expanded(
            child: TextField(
              cursorColor: Colors.brown,
              textAlign: TextAlign.end,
              decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: ScreenUtil().setSp(25)),
                  hintText: '请填写开户许可证上的银行编号',
                  border: InputBorder.none),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _registerAddress() {
    return Container(
      color: Colors.white,
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(100),
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(20), right: ScreenUtil().setWidth(20)),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              '注册场地地址',
              style: TextStyle(
                  color: Colors.black, fontSize: ScreenUtil().setSp(33)),
            ),
            flex: 1,
          ),
          Expanded(
            child: TextField(
              cursorColor: Colors.brown,
              textAlign: TextAlign.end,
              decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: ScreenUtil().setSp(25)),
                  hintText: '请填写营业执照上的注册地址',
                  border: InputBorder.none),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _registerPhone() {
    return Container(
      color: Colors.white,
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(100),
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(20), right: ScreenUtil().setWidth(20)),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              '注册固定电话',
              style: TextStyle(
                  color: Colors.black, fontSize: ScreenUtil().setSp(33)),
            ),
            flex: 1,
          ),
          Expanded(
            child: TextField(
              cursorColor: Colors.brown,
              textAlign: TextAlign.end,
              decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: ScreenUtil().setSp(25)),
                  hintText: '请填写营业执照上的注册电话',
                  border: InputBorder.none),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _default(typeProvider) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(20), right: ScreenUtil().setWidth(20)),
      child: ListTile(
        title: Text(
          '设为默认发票信息',
          style: TextStyle(color: Colors.brown),
        ),
        contentPadding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
        trailing: Checkbox(
            value: typeProvider.invoceSpecialType,
            onChanged: (isCheck) {
              typeProvider.invoceSpecialType = isCheck;
            }),
      ),
    );
  }

  Widget _info() {
    return Container(
        width: ScreenUtil().setWidth(750),
        padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(40),
            left: ScreenUtil().setWidth(20),
            right: ScreenUtil().setWidth(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              ' - 如果您需要开个人发票，请使用增值税普通发票',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            Text(
              ' - 请确保您填写的发票信息准确无误，因信息错误的问题发票我们将不予重开',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ));
  }

  Widget _confirmBtn(BuildContext context,typeProvider){
    return InkWell(
      onTap: () {
        print('点击了保存按钮!');
        Toast.show(context, '已保存!');
      },
      child: Container(
        color: Colors.white,
        width: ScreenUtil().setWidth(750),
        height: ScreenUtil().setHeight(130),
        child: Container(
          alignment: Alignment(0, 0),
          child: Text(
            '保存',
            style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(35)),
          ),
          margin: EdgeInsets.only(
              left: ScreenUtil().setWidth(30),
              right: ScreenUtil().setWidth(30),
              top: ScreenUtil().setHeight(15),
              bottom: ScreenUtil().setHeight(15)),
          decoration: BoxDecoration(
              color: typeProvider.invoceSpecialType
                  ? Colors.brown
                  : Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
        ),
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
}
