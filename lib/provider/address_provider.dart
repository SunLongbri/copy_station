import 'package:copy_station/model/address_model.dart';
import 'package:flutter/material.dart';

class AddressProvider with ChangeNotifier {
  AddressModel _addressModel = null;

  String _address = '请选择地址';

  bool _isCheck = false;

  String get address => _address;

  bool get isCheck => _isCheck;

  AddressModel get addressModel => _addressModel;


  set address(String address) {
    _address = address;
    notifyListeners();
  }

  set isCheck(bool isCheck){
    _isCheck = isCheck;
    notifyListeners();
  }

  set addAddress(AddressModel model){
    _addressModel = model;
    notifyListeners();

  }
}
