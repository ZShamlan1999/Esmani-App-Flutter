import 'package:flutter/material.dart';
import 'package:esmani_app/Screens/Cources/component/create_cource/add_cource_image_card.dart';
import 'package:esmani_app/Screens/GenralScreens/welcome_screen.dart';
import 'package:esmani_app/component/appBars/profile_app_bar.dart';
import 'package:esmani_app/main.dart';
import 'package:esmani_app/utils/constant.dart';
import 'package:esmani_app/utils/models/courses.dart';
import 'package:esmani_app/utils/models/lecturers.dart';
import 'package:esmani_app/utils/models/studnts.dart';
import 'package:esmani_app/utils/provider.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffEDEDED),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: kDefaultHeight * 2),
          child: ListView(
            children: [
              const ProfileAppBar(),
              if (context.read<MyProvider>().loginType == 1)
                studentProfileBuilder(),
              if (context.read<MyProvider>().loginType == 0)
                lecturerProfileBuilder(),
            ],
          ),
        ));
  }

  Widget lecturerProfileBuilder() {
    return Column(
      children: [
        AddCourseImageCard(image: 'assets/images/hussin.png'),
        Padding(
          padding: EdgeInsets.symmetric(vertical: kDefaultHeight * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Spacer(flex: 3),

                  // Lecturer Name
                  Text(
                    '${loginPreferences.getString('fullname')}',
                    style: TextStyle(
                      fontSize: fontSize20,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(width: kDefaultWidth),

                  // button to Edit Lecturer name
                  InkWell(
                    onTap: () => editLecturerName(),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.black54,
                    ),
                  ),
                  const Spacer()
                ],
              ),
              Text(
                'Degree: Doctor',
                style: TextStyle(fontSize: fontSize16, color: Colors.grey),
              ),
            ],
          ),
        ),
        LogOutButton()
      ],
    );
  }

  Widget studentProfileBuilder() {
    return Column(
      children: [
        const AddCourseImageCard(image: 'assets/images/hussin.png'),
        Padding(
          padding: EdgeInsets.symmetric(vertical: kDefaultHeight * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${loginPreferences.getString('fullname')}",
                style: TextStyle(
                  fontSize: fontSize20,
                ),
              ),
              Text(
                "Level: ${loginPreferences.getString('level')}",
                style: TextStyle(
                  fontSize: fontSize20,
                ),
              ),
            ],
          ),
        ),
        const LogOutButton()
      ],
    );
  }

  Future editLecturerName() {
    TextEditingController con = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          title: const Center(child: Text('Edit Name')),
          content: SizedBox(
            height: 120,
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  child: TextFormField(
                    controller: con,
                    cursorColor: const Color(0xff535353),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        bottom: kDefaultHeight,
                        left: kDefaultWidth,
                      ),
                      hintText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: kDefaultHeight * 2),
                Consumer<Lecturers>(
                  builder: (context, value, child) {
                    return MaterialButton(
                      onPressed: () {
                        value.ChangeName(con.text);
                        Navigator.pop(context);
                      },
                      minWidth: kDefaultWidth * 20,
                      color: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kDefaultWidth),
                      ),
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontFamily: 'inter',
                          color: Colors.white,
                          fontSize: fontSize18,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    int loginType = context.watch<MyProvider>().loginType!;
    return Container(
      margin: EdgeInsets.only(top: kDefaultHeight * 10),
      child: loginType == 0 ? lecturerMode() : studentMode(),
    );
  }

  Widget lecturerMode() {
    return Consumer<Lecturers>(
      builder: (context, value, child) {
        return Row(
          children: [
            Expanded(
              child: SizedBox(
                height: kDefaultHeight * 5.6,
                child: MaterialButton(
                  elevation: 0,
                  onPressed: () {
                    var route = MaterialPageRoute(
                        builder: (context) => const Welcome());
                    Navigator.pushReplacement(context, route);
                    value.homePageIndex = 1;
                    context.read<Courses>().clearLecturerCourses();
                  },
                  color: Colors.white,
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: fontSize20,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'lexend',
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget studentMode() {
    return Consumer<Students>(
      builder: (context, value, child) {
        return Row(
          children: [
            Expanded(
              child: SizedBox(
                height: kDefaultHeight * 5.6,
                child: MaterialButton(
                  elevation: 0,
                  onPressed: () {
                    var route = MaterialPageRoute(
                        builder: (context) => const Welcome());
                    Navigator.pushReplacement(context, route);
                    value.homePageIndex = 0;
                    context.read<Courses>().clearStudentCourses();
                  },
                  color: Colors.white,
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: fontSize20,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'lexend',
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
