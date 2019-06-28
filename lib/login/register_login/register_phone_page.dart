import 'package:copy_station/helper/Toast.dart';
import 'package:copy_station/helper/data.dart';
import 'package:copy_station/net/service_method.dart';
import 'package:copy_station/net/service_url.dart';
import 'package:copy_station/provider/type_provider.dart';
import 'package:copy_station/routers/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RegisterPhonePage extends StatefulWidget {
  @override
  _RegisterPhonePageState createState() => _RegisterPhonePageState();
}

class _RegisterPhonePageState extends State<RegisterPhonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(35),
                  right: ScreenUtil().setWidth(35)),
              child: Image.asset(
                'images/arros_back.png',
              ),
            )),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.only(
            top: ScreenUtil().setHeight(50),
            left: ScreenUtil().setWidth(30),
            right: ScreenUtil().setWidth(30)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _titleWidget(),
            _contentWidget(),
            _arrowWidget(context)
          ],
        ),
      ),
    );
  }

  Widget _titleWidget() {
    return Container(
      child: Text(
        '注册',
        style: TextStyle(
            color: Colors.brown,
            fontSize: ScreenUtil().setSp(48),
            fontWeight: FontWeight.bold),
      ),
    );
  }

  TextEditingController phoneController = TextEditingController();

  Widget _contentWidget() {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(50)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '手机号',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: ScreenUtil().setSp(36),
                color: Colors.brown),
          ),
          Theme(
            data: ThemeData(primaryColor: Colors.brown),
            child: TextField(
              controller: phoneController,
              cursorColor: Colors.brown,
              maxLength: 11,
              buildCounter: _counter,
              keyboardType: TextInputType.phone,
            ),
          )
        ],
      ),
    );
  }

  Widget _counter(
    BuildContext context, {
    int currentLength,
    int maxLength,
    bool isFocused,
  }) {
    return Container();
  }

  Widget _arrowWidget(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(80),
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(90)),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: FractionalOffset(1.0, 0.5),
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                print('进入到输入邮箱地址界面');
                String phone = phoneController.text;
                if (phone.isEmpty) {
                  Toast.show(context, '手机号不能为空!');
                  return;
                }
                print('获取到的手机号为:${phone}');
                var formData = {'tel': phone};
                var typeProvider = Provider.of<TypeProvider>(context);
                post(formData,servicePath['sms']).then((val) {
                  if (val['code'] == 0) {
                    typeProvider.smsState = true;
                    print('发送成功');
                    Data.prefs.setString('registerPhone', phone);
                  } else {
                    typeProvider.smsState = false;
                    print('发送失败');
                  }
                });
                Application.router.navigateTo(context, '/mail');
              },
              child: Image.asset(
                'images/arrow.png',
                width: ScreenUtil().setWidth(103),
                height: ScreenUtil().setHeight(103),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
