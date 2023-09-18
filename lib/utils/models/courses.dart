import 'package:flutter/material.dart';

class Courses with ChangeNotifier {
  int? selectedCourseIndex;
  int? selectedCourseID;
  String? courseLevel;
  String? courseHour;
  String? coursePeriod;
  String? courseDepartment;
  List<Map<String, dynamic>> lecturerCourses = [];
  List<Map<String, dynamic>> studentCourses = [];

  void changeCoursesList(List<Map<String, dynamic>> list) {
    lecturerCourses = list;
    notifyListeners();
  }

  void changeStudentCourses(List<Map<String, dynamic>> list) {
    studentCourses = list;
    notifyListeners();
  }

  void changeCourseLevel(String val) {
    courseLevel = val;
    notifyListeners();
  }

  void changeCourseHour(String val) {
    courseHour = val;
    notifyListeners();
  }

  void changeCoursePeriod(String val) {
    coursePeriod = val;
    notifyListeners();
  }

  void changeCourseDepartment(String val) {
    courseDepartment = val;
    notifyListeners();
  }

  void clearStudentCourses() {
    studentCourses = [];
    notifyListeners();
  }

  void clearLecturerCourses() {
    lecturerCourses = [];
    notifyListeners();
  }

  void changeSelectedCourseIndex(int index) {
    selectedCourseIndex = index;
    notifyListeners();
  }

  void changeSelectedCourseID(int id) {
    selectedCourseID = id;
    notifyListeners();
  }
}
