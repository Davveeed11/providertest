import 'package:flutter/material.dart';

class HomeModel extends ChangeNotifier{
  int start = 0;

  void increment(){
    start++;
    notifyListeners();
  }

  void decrement(){
    start--;
    notifyListeners();
  }
}