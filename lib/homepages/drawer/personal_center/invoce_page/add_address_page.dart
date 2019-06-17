import 'package:city_pickers/city_pickers.dart';
import 'package:copy_station/model/address_model.dart';
import 'package:copy_station/provider/address_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddAddressPage extends StatefulWidget {
  @override
  _AddAddressPageState createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  String address = '';
  bool isCheck;
  AddressModel model = null;
  TextEditingController detailAddressController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var addressProvider = Provider.of<AddressProvider>(context);
    isCheck = addressProvider.isCheck;
    print('------>isCheck:${isCheck}');

    addressProvider.addAddress = AddressModel(
      detailAddress: '请填写详细地址',
      destName: '填写收件人姓名',
      phone: '填写手机号码',
      postalCode: '填写邮编',
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('快递地址'),
        leading: _back(context),
      ),
      body: Stack(
        children: <Widget>[
          _addressContent(context, addressProvider),
          Positioned(
            child: _bottomButton(addressProvider),
            bottom: 0,
          ),
        ],
      ),
    );
  }

  //列表的主题内容
  Widget _addressContent(context, addressProvider) {
    return Container(
      child: Column(
        children: <Widget>[
          _singleLine(context, addressProvider),
          Divider(
            indent: 10,
            color: Colors.grey,
          ),
          _commanLine(
              '详细地址',
              addressProvider.addressModel.detailAddress ?? '请填写详细地址',
              detailAddressController),
          Divider(
            indent: 10,
            color: Colors.grey,
          ),
          _commanLine(
              '收件人姓名',
              addressProvider.addressModel.destName ?? '填写收件人姓名',
              nameController),
          Divider(
            indent: 10,
            color: Colors.grey,
          ),
          _commanLine('手机号码', addressProvider.addressModel.phone ?? '填写手机号码',
              phoneController),
          Divider(
            indent: 10,
            color: Colors.grey,
          ),
          _commanLine('邮政编码', addressProvider.addressModel.postalCode ?? '填写邮编',
              codeController),
          Divider(
            indent: 10,
            color: Colors.grey,
          ),
          Container(
            margin: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    '设为默认地址',
                    style: TextStyle(
                        color: Colors.brown, fontSize: ScreenUtil().setSp(35)),
                  ),
                  flex: 1,
                ),
                Checkbox(
                    value: isCheck,
                    onChanged: (check) {
                      addressProvider.isCheck = check;
                      addressProvider.addressModel.defaultType = check;
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }

  //单个条目的样式
  Widget _commanLine(
      String title, String hint, TextEditingController controllerType) {
    return Container(
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(20), right: ScreenUtil().setWidth(10)),
      height: ScreenUtil().setHeight(80),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.black, fontSize: ScreenUtil().setSp(35)),
            ),
            flex: 1,
          ),
          Container(
              width: ScreenUtil().setWidth(300),
              height: ScreenUtil().setHeight(50),
              child: TextField(
                controller: controllerType,
                textAlign: TextAlign.end,
                cursorColor: Colors.brown,
                decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: TextStyle(
                        color: Colors.grey, fontSize: ScreenUtil().setSp(30)),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.only(top: ScreenUtil().setHeight(12))),
              )),
        ],
      ),
    );
  }

  //底部按钮
  Widget _bottomButton(addressProvider) {
    return Container(
        width: ScreenUtil().setWidth(750),
        height: ScreenUtil().setHeight(130),
        color: Colors.white,
        child: InkWell(
          onTap: () {
            model = AddressModel(
              detailAddress: detailAddressController.text,
              destName: nameController.text,
              phone: phoneController.text,
              postalCode: codeController.text,
            );

            print('点击了添加快递地址按钮!');
            print('详细地址为:${addressProvider.addressModel.detailAddress}');
          },
          child: Container(
            alignment: Alignment(0, 0),
            margin: EdgeInsets.only(
                left: ScreenUtil().setWidth(40),
                right: ScreenUtil().setWidth(40),
                top: ScreenUtil().setHeight(20),
                bottom: ScreenUtil().setHeight(20)),
            child: Text(
              '保存',
              style: TextStyle(
                  color: Colors.white, fontSize: ScreenUtil().setSp(40)),
            ),
            decoration: BoxDecoration(
                color: isCheck ? Colors.brown : Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
          ),
        ));
  }

  //所在地区栏
  Widget _singleLine(BuildContext context, AddressProvider addressProvider) {
    return Container(
      height: ScreenUtil().setHeight(80),
      width: ScreenUtil().setWidth(750),
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(20), top: ScreenUtil().setHeight(20)),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              '所在地区',
              style: TextStyle(
                  color: Colors.black, fontSize: ScreenUtil().setSp(35)),
            ),
            flex: 1,
          ),
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              Result result2 = await CityPickers.showFullPageCityPicker(
                context: context,
                theme: ThemeData(
                    splashColor: Colors.brown,
                    highlightColor: Colors.brown,
                    primaryColor: Colors.brown),
              );
              print('resutl2:${result2}');
              String address =
                  result2.provinceName + result2.cityName + result2.areaName;
              addressProvider.address = address;
              addressProvider.addressModel.address = address;
            },
            child: Padding(
              padding: EdgeInsets.only(
                right: ScreenUtil().setWidth(20),
              ),
              child: Text(
                addressProvider.address,
                style: TextStyle(
                    color: Colors.grey, fontSize: ScreenUtil().setSp(30)),
              ),
            ),
          ),
        ],
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
