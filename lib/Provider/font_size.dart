import 'package:flutter/cupertino.dart';

class FontSizeNotify extends ChangeNotifier{
  double fontSize = 22;
  double fontNextSize = 25;
  
  double get getFontFirst => fontSize;
  double get getFontNext => fontNextSize;

  changeFontSize(double newValue){
    fontSize = newValue;
    notifyListeners();
  }

  changeFontNextSize(double newValue){
    fontNextSize = newValue;
    notifyListeners();
  }
}