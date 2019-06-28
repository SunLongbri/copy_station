import 'package:flutter/material.dart';

class TypeProvider with ChangeNotifier {
  bool _net_error = false; //true表示网络异常，false表示网络正常；

  String _moneyType = '企业管理费';
  bool _invoceCommonType = false;
  bool _invoceSpecialType = false;
  int _languageType = 1;
  bool _smsState = false; //验证码是否发送成功，true表示发送成功，false表示发送失败

  bool _isPhone = true;

  get isPhone => _isPhone;

  get smsState => _smsState;

  set phoneState(bool isPhone) {
    _isPhone = isPhone;
    notifyListeners();
  }

  set smsState(bool state) {
    _smsState = state;
    notifyListeners();
  }

  get netError => _net_error;

  get moneyTpye => _moneyType;

  get invoceCommonType => _invoceCommonType;

  get invoceSpecialType => _invoceSpecialType;

  get languageType => _languageType;

  set netError(bool net) {
    _net_error = net;
    notifyListeners();
  }

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
