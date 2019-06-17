import 'package:flutter/material.dart';

class TabProvider with ChangeNotifier {
  bool _isLeft = true;
  bool _isRight = false;

  get isLeft => _isLeft;

  get isRight => _isRight;

  changeLeftAndRight(String changeState) {
    if (changeState == 'left') {
      _isLeft = true;
      _isRight = false;
    } else {
      _isLeft = false;
      _isRight = true;
    }
    notifyListeners();
  }
}
