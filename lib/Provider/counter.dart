import 'package:flutter/material.dart';

class Counter extends ChangeNotifier{
  int cnt = 0 ;
  String txt = 'Provider';

  intCnt(){
    cnt ++;
    notifyListeners();
  }

  deCnt(){
    if(cnt > 0) cnt --;
    notifyListeners();
  }
}