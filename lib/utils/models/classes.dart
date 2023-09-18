import 'package:flutter/material.dart';

class Classes with ChangeNotifier {
  int? selectedCourseID;
  int? selectedClassIndex;
  List<Map<String, dynamic>> lecturerClasses = [];
  List<Map<String, dynamic>> studentClasses = [];

  void changeLecturerClasses(List<Map<String, dynamic>> list) {
    lecturerClasses = list;
    notifyListeners();
  }

  void changeStudentClasses(List<Map<String, dynamic>> list) {
    studentClasses = list;
    notifyListeners();
  }

  void changeSelectedCourseID(int courseID) {
    selectedCourseID = courseID;
    notifyListeners();
  }

  void changeSelectedIndex(int index) {
    selectedClassIndex = index;
    notifyListeners();
  }
}
