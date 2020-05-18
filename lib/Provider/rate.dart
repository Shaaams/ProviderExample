import 'package:flutter/cupertino.dart';

class RateNotifiy extends ChangeNotifier{

  double rate = 0;

  changeRate(double newValeu){
    rate = newValeu;
    notifyListeners();
  }
}