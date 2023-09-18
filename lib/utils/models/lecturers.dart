import 'package:flutter/material.dart';

class Lecturers with ChangeNotifier {
  String lecturerName = 'Hussein Mohammed';
  int homePageIndex = 1;

  void ChangeName(String name) {
    lecturerName = name;
    notifyListeners();
  }

  void changeIndex(int index) {
    this.homePageIndex = index;
    notifyListeners();
  }
}
