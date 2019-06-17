import 'package:flutter/foundation.dart';

class SearchProvider with ChangeNotifier {
  bool _isSearch = false;

  bool get isSearch => _isSearch;

  set isSearch(bool isSearch){
    _isSearch = isSearch;
    notifyListeners();
  }
}