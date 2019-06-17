import 'package:flutter/foundation.dart';

class CityProvider with ChangeNotifier {
  //城市名称
  String _cityName = '上海';

  String get cityName => _cityName;

  set cityName(String cityName) {
    _cityName = cityName;
    notifyListeners();
  }
}
