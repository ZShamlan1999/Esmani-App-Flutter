import 'package:flutter/material.dart';
import 'package:esmani_app/Screens/Cources/component/join_to_cource_dialog.dart';
import 'package:esmani_app/Screens/Cources/component/view_cources/search_bar.dart';
import 'package:esmani_app/Screens/classes/class_details.dart';
import 'package:esmani_app/Screens/classes/create_class.dart';
import 'package:esmani_app/Screens/classes/edit_class.dart';
import 'package:esmani_app/component/Other_Component/floating_add_button.dart';
import 'package:esmani_app/component/Other_Component/join_to_cource_floating_button.dart';
import 'package:esmani_app/component/appBars/Cources_app_bar.dart';
import 'package:esmani_app/main.dart';
import 'package:esmani_app/utils/constant.dart';
import 'package:esmani_app/utils/crud.dart';
import 'package:esmani_app/utils/linkapi.dart';
import 'package:esmani_app/utils/models/classes.dart';
import 'package:esmani_app/utils/models/courses.dart';
import 'package:esmani_app/utils/provider.dart';
import 'package:provider/provider.dart';

class ClassesScreen extends StatefulWidget {
  const ClassesScreen({super.key});

  @override
  State<ClassesScreen> createState() => _ClassesScreenState();
}

class _ClassesScreenState extends State<ClassesScreen> {
  Crud crud = Crud();
  List<Map<String, dynamic>> _lecturerClasses = [];
  List<Map<String, dynamic>> _studentClasses = [];

  @override
  void initState() {
    context.read<Classes>().lecturerClasses = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var loginType = context.watch<MyProvider>().loginType;
    return Scaffold(
      floatingActionButton: loginType == 0
          ? FlotingAddButton(screen: CreateClass())
          : JoinToCourceFloatingButton(onTap: showQRCodeDialog),
      body: Column(
        children: [
          const CourcesAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultWidth,
              vertical: kDefaultHeight,
            ),
            child: SearchCard(placeHolder: 'Search'),
          ),
          loginType == 0 ? lecturerClassesBuilder() : studentClassesBuilder()
        ],
      ),
    );
  }

  Widget lecturerClassesBuilder() {
    return Expanded(
        child: FutureBuilder(
      future: getLecturerClasses(),
      builder: (context, AsyncSnapshot snapshot) {
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
            _lecturerClasses.add(item);
          }
          Future.delayed(Duration.zero, () {
            context.read<Classes>().changeLecturerClasses(_lecturerClasses);
          });
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: _lecturerClasses.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                      onTap: () {
                        var route = MaterialPageRoute(
                          builder: (context) => const ClassDetails(),
                        );
                        context.read<Classes>().changeSelectedIndex(index);
                        Navigator.push(context, route);
                      },
                      title: Text(
                        "${_lecturerClasses[index]['ClassName']}",
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
                        child: _lecturerClasses[index]['Image'] != null
                            ? CircleAvatar(
                                backgroundColor: Colors.white,
                                foregroundImage: AssetImage(
                                  "${_lecturerClasses[index]['Image']}",
                                ),
                              )
                            : const Center(child: Text("Class")),
                      ),
                      trailing: moreOptionsButton(_lecturerClasses[index])),
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

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }

  Widget studentClassesBuilder() {
    return Expanded(
        child: FutureBuilder(
      future: getStudentClasses(),
      builder: (context, AsyncSnapshot snapshot) {
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
            _studentClasses.add(item);
          }
          Future.delayed(Duration.zero, () {
            context.read<Classes>().changeStudentClasses(_studentClasses);
          });
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: _studentClasses.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                      onTap: () {
                        var route = MaterialPageRoute(
                          builder: (context) => const ClassDetails(),
                        );
                        context.read<Classes>().changeSelectedIndex(index);
                        Navigator.push(context, route);
                      },
                      title: Text(
                        "${_studentClasses[index]['ClassName']}",
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
                        child: _studentClasses[index]['Image'] != null
                            ? CircleAvatar(
                                backgroundColor: Colors.white,
                                foregroundImage: AssetImage(
                                  "${_studentClasses[index]['Image']}",
                                ),
                              )
                            : const Center(child: Text("Class")),
                      ),
                      trailing: moreOptionsButton(_studentClasses[index])),
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

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }

  getLecturerClasses() async {
    int _index = context.read<Courses>().selectedCourseIndex!;
    var _courses = context.read<Courses>().lecturerCourses;

    Map<String, dynamic> response = await crud.postRequest(
        linkViewClass, {'courseid': '${_courses[_index]['CourseID']}'});
    List<Map<String, dynamic>> dataList = [];
    if (response['status'] == 'Success') {
      for (var item in response['data']) {
        dataList.add(item);
      }
      context.read<Classes>().changeLecturerClasses(dataList);
    }
    return response;
  }

  getStudentClasses() async {
    int? index = context.read<Courses>().selectedCourseIndex;
    List<Map<String, dynamic>> _courses =
        context.read<Courses>().studentCourses;

    Map<String, dynamic> response = await crud.postRequest(linkViewClassOfStudent, {
      'accountno': loginPreferences.getString('id'),
      'courseid': '${_courses[index!]['CourseID']}'
    });
    List<Map<String, dynamic>> dataList = [];
    if (response['status'] == 'Success') {
      for (var item in response['data']) {
        dataList.add(item);
      }
      context.read<Classes>().changeStudentClasses(dataList);
    }

    print(response);
    return response;
  }

  Widget moreOptionsButton(Map<String, dynamic> map) {
    List<PopupMenuEntry<String>> menuItems = [
      PopupMenuItem<String>(value: "edit", child: Text("Edit")),
    ];

    return PopupMenuButton<String>(
      child: Icon(Icons.more_horiz, size: 35),
      itemBuilder: (context) => menuItems,
      onSelected: (String value) {
        if (value == 'edit') {
          var route = MaterialPageRoute(
            builder: (context) => EditClass(classData: map),
          );
          Navigator.pushReplacement(context, route);
        }
      },
    );
  }

  showQRCodeDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return const JoinToCourceDialog();
      },
    );
  }
}
