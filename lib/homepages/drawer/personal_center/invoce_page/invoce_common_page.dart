import 'package:copy_station/helper/Toast.dart';
import 'package:copy_station/provider/type_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:copy_station/helper/color.dart';

class InvoceCommonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var typeProvider = Provider.of<TypeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('增值税普通发票'),
          leading: _back(context),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              color: bg_color,
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(
                        top: ScreenUtil().setHeight(10),
                        left: ScreenUtil().setWidth(20),
                        right: ScreenUtil().setWidth(20)),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: '如需开个人发票，请在此处输入"个人发票"',
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: ScreenUtil().setSp(35))),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(
                        top: ScreenUtil().setHeight(10),
                        left: ScreenUtil().setWidth(20),
                        right: ScreenUtil().setWidth(20)),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: '请填写纳税人识别号或身份证号',
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: ScreenUtil().setSp(35))),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(
                        left: ScreenUtil().setWidth(20),
                        right: ScreenUtil().setWidth(20)),
                    child: ListTile(
                      title: Text(
                        '设为默认发票信息',
                        style: TextStyle(color: Colors.brown),
                      ),
                      contentPadding:
                          EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                      trailing: Checkbox(
                          value: typeProvider.invoceCommonType,
                          onChanged: (isCheck) {
                            typeProvider.invoceCommonType = isCheck;
                          }),
                    ),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(750),
                    padding: EdgeInsets.only(
                        top: ScreenUtil().setHeight(40),
                        left: ScreenUtil().setWidth(20),
                        right: ScreenUtil().setWidth(20)),
                    child: Text(
                      '       应国家税务局总要求，自2017年7月1日起，开取增值税普通发票时，应提供纳税人识别号码或个人证件号码，不符合规定的发票，不得作为税收凭证。请认真填写你的开票信息。',
                      style: TextStyle(
                        color: Colors.brown,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              child: InkWell(
                onTap: () {
                  print('点击了保存按钮!');
                  Toast.show(context, '已保存!');
                  Navigator.pop(context);
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
                        color: typeProvider.invoceCommonType
                            ? Colors.brown
                            : Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  ),
                ),
              ),
              bottom: 0,
            ),
          ],
        ));
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
