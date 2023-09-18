import 'package:flutter/material.dart';
import 'package:esmani_app/Screens/Cources/component/view_cources/cource_year_filter.dart';
import 'package:esmani_app/Screens/Cources/component/view_cources/search_bar.dart';
import 'package:esmani_app/Screens/Cources/cource_details/classes_screen.dart';
import 'package:esmani_app/Screens/Cources/edit_course.dart';
import 'package:esmani_app/main.dart';
import 'package:esmani_app/utils/constant.dart';
import 'package:esmani_app/utils/crud.dart';
import 'package:esmani_app/utils/linkapi.dart';
import 'package:esmani_app/utils/models/courses.dart';
import 'package:esmani_app/utils/provider.dart';
import 'package:provider/provider.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen>  {
  List<Map<String, dynamic>> _lecturerCourses = [];
  List<Map<String, dynamic>> _studentCourses = [];
  Crud crud = Crud();

  @override
  void initState() {
    getLecturerCourses();
    getStudentCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: kDefaultWidth * 1.5, top: kDefaultHeight * 1.2),
          child: Row(
            children: [
              const Expanded(
                flex: 5,
                child: SearchCard(placeHolder: 'Search'),
              ),
              SizedBox(width: screenWidth * 0.015),
              const Expanded(flex: 2, child: CourcesYearFilter())
            ],
          ),
        ),
        SizedBox(height: screenHeight * 0.026),
        context.read<MyProvider>().loginType! == 0
            ? lecturerCoursesBuilder()
            : studentCoursesBuilder()
      ],
    );
  }

  Widget lecturerCoursesBuilder() {
    return Expanded(
      child: FutureBuilder(
        future: getLecturerCourses(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              print("${snapshot.error}");
            }
            if (snapshot.hasData) {
              if (snapshot.data!['status'] == 'Fail') {
                return Center(
                    child: Text(
                  'Does not Have any Course',
                  style: TextStyle(fontSize: 30),
                ));
              }
              for (var item in snapshot.data['data']) {
                _lecturerCourses.add(item);
              }
              Future.delayed(Duration.zero, () {
                context.read<Courses>().changeCoursesList(_lecturerCourses);
              });

              return ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: _lecturerCourses.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                          onTap: () {
                            var route = MaterialPageRoute(
                                builder: (context) => const ClassesScreen());
                            context
                                .read<Courses>()
                                .changeSelectedCourseIndex(index);
                            context.read<Courses>().changeSelectedCourseID(
                                _lecturerCourses[index]["CourseID"]);
                            Navigator.push(context, route);
                          },
                          title: Text(
                            "${_lecturerCourses[index]['CourseName']}",
                            style: TextStyle(
                              fontFamily: 'lexend',
                              fontSize: kPrimaryFontSize * 0.18,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            ),
                          ),
                          leading: Container(
                            height: screenHeight * 0.071,
                            width: screenHeight * 0.071,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(),
                            ),
                            child: _lecturerCourses[index]['Image'] != null
                                ? CircleAvatar(
                                    backgroundColor: Colors.white,
                                    foregroundImage: AssetImage(
                                      "${_lecturerCourses[index]['Image']}",
                                    ),
                                  )
                                : Center(child: Text("Course")),
                          ),
                          trailing: moreOptionsButton(_lecturerCourses[index])),
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.035),
                        child: const Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  );
                },
              );
            }
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget studentCoursesBuilder() {
    return Expanded(
      child: FutureBuilder(
        future: getStudentCourses(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              print("${snapshot.error}");
            }
            if (snapshot.hasData) {
              if (snapshot.data!['status'] == 'Fail') {
                return Center(
                    child: Text(
                  'Does not Have any Course',
                  style: TextStyle(fontSize: 30),
                ));
              }
              for (var item in snapshot.data['data']) {
                _studentCourses.add(item);
              }
              Future.delayed(Duration.zero, () {
                context.read<Courses>().changeStudentCourses(_studentCourses);
              });

              return ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: _studentCourses.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                          onTap: () {
                            var route = MaterialPageRoute(
                                builder: (context) => const ClassesScreen());
                            context
                                .read<Courses>()
                                .changeSelectedCourseIndex(index);
                            context.read<Courses>().changeSelectedCourseID(
                                _studentCourses[index]["CourseID"]);
                            Navigator.push(context, route);
                          },
                          title: Text(
                            "${_studentCourses[index]['CourseName']}",
                            style: TextStyle(
                              fontFamily: 'lexend',
                              fontSize: kPrimaryFontSize * 0.18,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            ),
                          ),
                          leading: Container(
                            height: screenHeight * 0.071,
                            width: screenHeight * 0.071,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(),
                            ),
                            child: _studentCourses[index]['Image'] != null
                                ? CircleAvatar(
                                    backgroundColor: Colors.white,
                                    foregroundImage: AssetImage(
                                      "${_studentCourses[index]['Image']}",
                                    ),
                                  )
                                : Center(child: Text("Course")),
                          ),
                          trailing: moreOptionsButton(_studentCourses[index])),
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.035),
                        child: const Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  );
                },
              );
            }
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  getLecturerCourses() async {
    if (context.read<MyProvider>().loginType == 0) {
      Map<String, dynamic> response = await crud.postRequest(
          linkViewCourse, {'lecturerid': loginPreferences.getString('id')});
      if (response['status'] == 'Success') {
        return response;
      } else {
        print("no data");
      }
    }
  }

  getStudentCourses() async {
    if (context.read<MyProvider>().loginType == 1) {
      Map<String, dynamic> response = await crud.postRequest(linkViewCourseOfStudent,
          {'accountno': loginPreferences.getString('id')});
      if (response['status'] == 'Success') {
        return response;
      } else {
        print("no data");
      }
    }
  }

  Widget moreOptionsButton(map) {
    List<PopupMenuEntry<String>> menuItems = [
      PopupMenuItem<String>(value: "edit", child: Text("Edit")),
    ];

    return PopupMenuButton<String>(
      child: Icon(Icons.more_horiz, size: 35),
      itemBuilder: (context) => menuItems,
      onSelected: (String value) {
        if (value == 'edit') {
          var route = MaterialPageRoute(
            builder: (context) => EditCourse(coursesList: map),
          );
          Navigator.push(context, route);
        }
      },
    );
  }
}
