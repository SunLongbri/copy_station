// ignore: must_be_immutable
import 'package:copy_station/provider/type_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MessageDialog extends Dialog {
  String title;
  String message;
  String negativeText;
  String positiveText;
  Function onCloseEvent;
  Function onPositivePressEvent;

  MessageDialog({
    Key key,
    @required this.title,
    @required this.message,
    this.negativeText,
    this.positiveText,
    this.onPositivePressEvent,
    @required this.onCloseEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var typeProvider = Provider.of<TypeProvider>(context);
    return Padding(
      padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(350),
          bottom: ScreenUtil().setHeight(440),
          left: ScreenUtil().setWidth(70),
          right: ScreenUtil().setWidth(70)),
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(10),
              bottom: ScreenUtil().setHeight(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _singleItem(context, '企业管理费', typeProvider),
              Divider(
                indent: 0.1,
                color: Colors.grey,
              ),
              _singleItem(context, '投资管理费', typeProvider),
              Divider(
                indent: 0.1,
                color: Colors.grey,
              ),
              _singleItem(context, '商务咨询费', typeProvider),
              Divider(
                indent: 0.1,
                color: Colors.grey,
              ),
              _singleItem(context, '会务服务费', typeProvider),
              Divider(
                indent: 0.1,
                color: Colors.grey,
              ),
              _singleItem(context, '服务费', typeProvider),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
        ),
      ),
    );
  }

  Widget _singleItem(BuildContext context, String content, typeProvider) {
    return InkWell(
      onTap: () {
        print('点击了对话框条目 ...  ');
        typeProvider.moneyType = content;
        Navigator.pop(context);
      },
      child: Container(
        alignment: Alignment(0, 0),
        height: ScreenUtil().setHeight(70),
        width: ScreenUtil().setWidth(600),
        child: Text(
          content,
          style:
              TextStyle(color: Colors.black, fontSize: ScreenUtil().setSp(35)),
        ),
      ),
    );
  }
}
