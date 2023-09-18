import 'package:flutter/material.dart';

class MyProvider with ChangeNotifier {
  bool loginTypeIsStudent = true;
  int? loginType; // if value 0 type is Lecturer, if 1 type is Student
  int index = 1;
  bool isAttend = true;
  bool classIsActive = true;
  bool lecturerMicIsOn = false;
  bool itemIsSelectd = false;


  List<Map> listStudents = [
    {'name': 'Hussein', 'image': 'assets/images/hussin.png'},
    {'name': 'Hussein', 'image': 'assets/images/hussin.png'},
    {'name': 'Hussein', 'image': ''},
    {'name': 'Hussein', 'image': 'assets/images/hussin.png'},
    {'name': 'Hussein', 'image': ''},
    {'name': 'Hussein', 'image': 'assets/images/hussin.png'},
  ];

  List<Map> listCources = [
    {
      'name': 'Mobile Application 1',
      'image': 'assets/images/phone.png',
    },
    {
      'name': 'Programming 1',
      'image': 'assets/images/labtop.png',
    },
    {
      'name': 'Programming 1',
      'image': 'assets/images/labtop.png',
    },
    {
      'name': 'Mobile Application 1',
      'image': 'assets/images/phone.png',
    },
    {
      'name': 'Programming 1',
      'image': 'assets/images/labtop.png',
    },
  ];

  List<Map> listClass = [
    {
      'name': 'Lecturer 1',
      'image': 'assets/images/phone.png',
    },
    {
      'name': 'Lecturer 2',
      'image': 'assets/images/labtop.png',
    },
    {
      'name': 'Lectuer 3',
      'image': 'assets/images/labtop.png',
    },
    {
      'name': 'Lectuer 4',
      'image': 'assets/images/phone.png',
    },
    {
      'name': 'Lectuer 5',
      'image': 'assets/images/labtop.png',
    },
    {
      'name': 'Lectuer 1',
      'image': 'assets/images/phone.png',
    },
    {
      'name': 'Lectuer 2',
      'image': 'assets/images/labtop.png',
    },
    {
      'name': 'Lectuer 3',
      'image': 'assets/images/labtop.png',
    },
    {
      'name': 'Lectuer 4',
      'image': 'assets/images/phone.png',
    },
    {
      'name': 'Lectuer 5',
      'image': 'assets/images/labtop.png',
    },
    {
      'name': 'Lectuer 1',
      'image': 'assets/images/phone.png',
    },
    {
      'name': 'Lectuer 2',
      'image': 'assets/images/labtop.png',
    },
    {
      'name': 'Lectuer 3',
      'image': 'assets/images/labtop.png',
    },
    {
      'name': 'Lectuer 4',
      'image': 'assets/images/phone.png',
    },
    {
      'name': 'Lectuer 5',
      'image': 'assets/images/labtop.png',
    },
  ];

  void DefineLoginType(int loginType) {
    this.loginType = loginType;
    notifyListeners();
  }

  void ChangeIndex(int index) {
    this.index = index;
    notifyListeners();
  }
}
