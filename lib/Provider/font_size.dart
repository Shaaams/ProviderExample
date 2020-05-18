import 'package:flutter/cupertino.dart';

class FontSizeNotify extends ChangeNotifier{
  double fontSize = 22;

  changeFontSize(double newValue){
    fontSize = newValue;
    notifyListeners();
  }
}