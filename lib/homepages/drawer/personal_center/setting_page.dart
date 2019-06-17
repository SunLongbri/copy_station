import 'package:copy_station/provider/type_provider.dart';
import 'package:copy_station/routers/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var typeProvider = Provider.of<TypeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('设置'),
        leading: _back(context),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _subItem(
                context, '语言', typeProvider.languageType == 1 ? '汉语' : '英语'),
            Divider(
              height: ScreenUtil().setHeight(2),
              indent: 16,
              color: Colors.grey,
            ),
            _subItem(context, '更新', '查看最新版本'),
            Divider(
              height: ScreenUtil().setHeight(2),
              indent: 16,
              color: Colors.grey,
            ),
            _subItem(context, '退出', '账户退出'),
          ],
        ),
      ),
    );
  }

  Widget _subItem(BuildContext context, String title, String content) {
    return Container(
      child: ListTile(
        title: Text(
          title,
          style:
              TextStyle(color: Colors.black, fontSize: ScreenUtil().setSp(40)),
        ),
        subtitle: Padding(
          padding: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
          child: Text(
            content,
            style:
                TextStyle(color: Colors.grey, fontSize: ScreenUtil().setSp(30)),
          ),
        ),
        onTap: () {
          if (title.contains('语言')) {
            _showInvoceInfoDialog(context).then((val) {
              print('val:${val}');
            });
          } else if (title.contains('更新')) {
          } else if (title.contains('退出')) {
            Application.router.navigateTo(context, '/register');
          }
        },
      ),
    );
  }

  Future<String> _showInvoceInfoDialog(BuildContext context) async {
    var typeProvider = Provider.of<TypeProvider>(context);
    var result = await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, state) {
            return SimpleDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              titlePadding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(150),
                  top: ScreenUtil().setHeight(30)),
              title: Container(
                child: Text('         语言'),
              ),
              contentPadding: EdgeInsets.only(left: 0),
              children: <Widget>[
                Divider(indent: 1, color: Colors.grey),
                RadioListTile(
                    value: 1,
                    groupValue: typeProvider.languageType,
                    title: new Text('汉语'),
                    onChanged: (T) {
                      state(() {
                        typeProvider.languageType = T;
                      });
                      Navigator.pop(context);
                    }),
                Divider(indent: 1, color: Colors.grey),
                RadioListTile(
                    value: 2,
                    groupValue: typeProvider.languageType,
                    title: new Text('英语'),
                    onChanged: (T) {
                      state(() {
                        typeProvider.languageType = T;
                      });
                      Navigator.pop(context);
                    }),
              ],
            );
          });
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
