import 'package:doxbox/views/home/home_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBarProvider extends ChangeNotifier {
  int navBarSelectedIndex = 0;

  void changeNavBarSelectedIndex(int newIndex) {
    navBarSelectedIndex = newIndex;
    notifyListeners();
  }
}
