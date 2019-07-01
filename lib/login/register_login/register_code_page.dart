import 'dart:async';
import 'dart:convert';

import 'package:copy_station/helper/Toast.dart';
import 'package:copy_station/helper/data.dart';
import 'package:copy_station/net/service_method.dart';
import 'package:copy_station/net/service_url.dart';
import 'package:copy_station/provider/type_provider.dart';
import 'package:copy_station/routers/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RegisterCodePage extends StatefulWidget {
  @override
  _RegisterCodePageState createState() => _RegisterCodePageState();
}

class _RegisterCodePageState extends State<RegisterCodePage> {
  @override
  void initState() {
    reGetCountdown();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var typeProvider = Provider.of<TypeProvider>(context);
//    _judgeSms(typeProvider);
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
        width: ScreenUtil().setWidth(Data.width),
        height: ScreenUtil().setHeight(Data.height),
        margin: EdgeInsets.only(
            left: ScreenUtil().setWidth(40),
            top: ScreenUtil().setHeight(40),
            right: ScreenUtil().setWidth(40)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _titleWidget(),
            _fieldWidget(),
            _timerCount(),
            _arrowWidget(context)
          ],
        ),
      ),
    );
  }

  Widget _timerCount() {
    return Container(
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
        width: ScreenUtil().setWidth(750),
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            if (_codeCountdownStr.toString().trim().contains('秒')) {
              Toast.show(context, '请稍后再试!');
            } else {
              String phone = Data.prefs.getString('registerPhone');
              var formData = {'phoe': phone};
              post(formData, servicePath['sms']).then((val) {

                if (val['errCode'] == 0) {
                  reGetCountdown();
                  Toast.show(context, '发送成功!');
                } else {
                  Toast.show(context, '发送失败!');
                }
              });
            }
          },
          child: Text(
            '${_codeCountdownStr}',
            style: TextStyle(
                color: Colors.brown,
                fontSize: ScreenUtil().setSp(36),
                fontWeight: FontWeight.w500),
          ),
        ));
  }

  Timer _countdownTimer;
  String _codeCountdownStr = '重新发送';

  void reGetCountdown() {
    setState(() {
      if (_countdownTimer != null) {
        return;
      }
      // Timer的第一秒倒计时是有一点延迟的，为了立刻显示效果可以添加下一行。
      _codeCountdownStr = '(${Data.regisTime--}秒)重新发送';
      _countdownTimer = new Timer.periodic(new Duration(seconds: 1), (timer) {
        setState(() {
          if (Data.regisTime > 0) {
            _codeCountdownStr = '(${Data.regisTime--}秒)重新发送';
          } else {
            _codeCountdownStr = '重新发送';
            Data.regisTime = 59;
            _countdownTimer.cancel();
            _countdownTimer = null;
          }
        });
      });
    });
  }

  // 不要忘记在这里释放掉Timer
  @override
  void dispose() {
    _countdownTimer?.cancel();
    _countdownTimer = null;
    super.dispose();
  }

  Widget _titleWidget() {
    return Container(
      child: Text(
        '请输入验证码',
        style: TextStyle(
            color: Colors.brown,
            fontSize: ScreenUtil().setSp(47),
            fontWeight: FontWeight.w500),
      ),
    );
  }

  TextEditingController codeController = TextEditingController();

  Widget _fieldWidget() {
    return Container(
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
        width: ScreenUtil().setWidth(650),
        child: Theme(
          data: ThemeData(primaryColor: Colors.brown),
          child: TextField(
            buildCounter: _counter,
            maxLength: 6,
            cursorColor: Colors.brown,
            keyboardType: TextInputType.number,
            controller: codeController,
          ),
        ));
  }

  /// TextField 字符统计显示
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
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: FractionalOffset(1.0, 0.5),
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                String phone = Data.prefs.getString('registerPhone');

                var formData = {
                  'authcode': codeController.text.toString().trim(),
                  'phone': phone
                };
                print('注册的FormData为:${formData}');
                post(formData, servicePath['registerByTel']).then((val) {
                  print('进入主页面返回的结果为:${val}');
                  var data;
                  if(val is Map<String,dynamic>){
                    data = val;
                  }else{
                    data = json.decode(val.toString());
                  }

                  if(data['errCode']==0){
                    Toast.show(context, '注册成功');
                    Application.router.navigateTo(context, '/home');
                  }else{
                    Toast.show(context, data['message']);
                  }

                });
                print('进入到输入邮箱地址界面');
              },
              child: Image.asset(
                'images/arrow.png',
                width: ScreenUtil().setWidth(101),
                height: ScreenUtil().setHeight(102),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future _judgeSms(typeProvider) async {
    print('当前发送信息的状态:${typeProvider.smsState}');
    if (typeProvider.smsState) {
      Toast.show(context, '验证码发送成功');
    } else {
      Toast.show(context, '验证码发送失败,请重试!');
    }
  }
}
