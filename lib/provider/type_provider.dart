import 'package:flutter/material.dart';

class TypeProvider with ChangeNotifier {
  String _moneyType = '企业管理费';
  bool _invoceCommonType = false;
  bool _invoceSpecialType = false;
  int _languageType = 1;

  bool _isPhone = true;
  get isPhone => _isPhone;
  set phoneState(bool isPhone){
    _isPhone = isPhone;
    notifyListeners();
  }

  get moneyTpye => _moneyType;

  get invoceCommonType => _invoceCommonType;

  get invoceSpecialType => _invoceSpecialType;

  get languageType => _languageType;

  set moneyType(String moneyType) {
    _moneyType = moneyType;
    notifyListeners();
  }

  set invoceCommonType(bool isCheck) {
    _invoceCommonType = isCheck;
    notifyListeners();
  }

  set invoceSpecialType(bool isCheck) {
    _invoceSpecialType = isCheck;
    notifyListeners();
  }

  set languageType(int type) {
    _languageType = type;
    notifyListeners();
  }
}
