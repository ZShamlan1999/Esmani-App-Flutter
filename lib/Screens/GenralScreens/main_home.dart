// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:esmani_app/Screens/Main_Screens/home_screen.dart';
import 'package:esmani_app/Screens/Main_Screens/profile.dart';
import 'package:esmani_app/Screens/Main_Screens/students_screen.dart';
import 'package:esmani_app/component/NavigationBars/lecturer_navBar.dart';
import 'package:esmani_app/component/NavigationBars/student_navBar.dart';
import 'package:esmani_app/utils/models/lecturers.dart';
import 'package:esmani_app/utils/models/studnts.dart';
import 'package:esmani_app/utils/provider.dart';
import 'package:provider/provider.dart';

class MainHome extends StatelessWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var loginType = context.watch<MyProvider>().loginType!;
    return loginType == 0
        ? const LecturerMainBuilder()
        : StudentMainHomeBuilder();
  }
}

class LecturerMainBuilder extends StatelessWidget {
  const LecturerMainBuilder({super.key});

  final List<Widget> tabList = const [
    StudentsScreen(),
    HomeScreen(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    int currentIndex = context.watch<Lecturers>().homePageIndex;
    return Scaffold(
      bottomNavigationBar: LecturerNavBar(),
      body: Container(
        child: tabList.elementAt(currentIndex),
      ),
    );
  }
}

class StudentMainHomeBuilder extends StatelessWidget {
  const StudentMainHomeBuilder({Key? key}) : super(key: key);

  final List<Widget> tabList = const [
    HomeScreen(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: StudentNavBar(),
      body: Container(
        child: tabList.elementAt(context.watch<Students>().homePageIndex),
      ),
    );
  }
}
