import 'package:flutter/material.dart';

class Students with ChangeNotifier {
  int homePageIndex = 0;


  List<Map> listStudents = [
    {'name': 'Hussein', 'image': 'assets/images/hussin.png'},
    {'name': 'Hussein', 'image': 'assets/images/hussin.png'},
    {'name': 'Hussein', 'image': ''},
    {'name': 'Hussein', 'image': 'assets/images/hussin.png'},
    {'name': 'Hussein', 'image': ''},
    {'name': 'Hussein', 'image': 'assets/images/hussin.png'},
  ];


  void changeIndex(int index) {
    this.homePageIndex = index;
    notifyListeners();
  }
}
