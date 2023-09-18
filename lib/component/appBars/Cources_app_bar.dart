import 'package:flutter/material.dart';
import 'package:esmani_app/component/appBars/component/qr_code.dart';
import 'package:esmani_app/component/appBars/component/toggle_button.dart';
import 'package:esmani_app/utils/constant.dart';
import 'package:esmani_app/utils/crud.dart';
import 'package:esmani_app/utils/linkapi.dart';
import 'package:esmani_app/utils/models/courses.dart';
import 'package:esmani_app/utils/provider.dart';
import 'package:provider/provider.dart';

class CourcesAppBar extends StatefulWidget {
  const CourcesAppBar({Key? key}) : super(key: key);

  @override
  State<CourcesAppBar> createState() => _CourcesAppBarState();
}

class _CourcesAppBarState extends State<CourcesAppBar> {
  Crud crud = Crud();
  var loginType;
  int? index;
  int studentCount = 0;

  @override
  void initState() {
    super.initState();
    loginType = context.read<MyProvider>().loginType;
    index = context.read<Courses>().selectedCourseIndex;
    getStudentCount();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultWidth * 2),
      color: kPrimaryColor,
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                backIcon(),
                SizedBox(height: kPrimaryFontSize * .10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    loginType == 0 ? lecturerImage() : studentLecturerImage(),
                    SizedBox(width: screenWidth * 0.08),
                    courseDetails(),
                  ],
                ),
                SizedBox(height: kDefaultHeight * 0.5),
              ],
            ),
            const SizedBox(height: 10),
            courseQrCode(),
          ],
        ),
      ),
    );
  }

  getStudentCount() async {
    int _courseID = context.read<Courses>().selectedCourseID!;
    Map<String, dynamic> response = await crud.postRequest(
        linkCountStudentsInCourse, {'courseid': '$_courseID'});
    if (response['status'] == 'Success') {
      setState(() {
        studentCount = response['data'][0]['COUNT(StudentID)'];
      });
    } else {
      return "Field";
    }
  }

  Widget backIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {},
          child: const Icon(Icons.arrow_back_rounded, color: Colors.white),
        )
      ],
    );
  }

  Widget lecturerImage() {
    return Container(
      height: screenHeight * 0.1,
      width: screenHeight * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: kSecondaryColor,
      ),
      child: context.watch<Courses>().lecturerCourses[index!]['Image'] != null
          ? CircleAvatar(
              backgroundColor: Colors.white,
              foregroundImage: AssetImage(loginType == 0
                  ? "${context.watch<Courses>().lecturerCourses[index!]['Image']}"
                  : "${context.watch<Courses>().studentCourses[index!]['Image']}"),
            )
          : Center(
              child: Icon(Icons.camera_alt),
            ),
    );
  }

  Widget studentLecturerImage() {
    return Container(
      height: screenHeight * 0.1,
      width: screenHeight * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: kSecondaryColor,
      ),
      child: context.watch<Courses>().studentCourses[index!]['Image'] != null
          ? CircleAvatar(
              backgroundColor: Colors.white,
              foregroundImage: AssetImage(loginType == 0
                  ? "${context.watch<Courses>().studentCourses[index!]['Image']}"
                  : "${context.watch<Courses>().studentCourses[index!]['Image']}"),
            )
          : Center(
              child: Icon(Icons.camera_alt),
            ),
    );
  }

  Widget courseDetails() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              loginType == 0
                  ? "${context.watch<Courses>().lecturerCourses[index!]['CourseName']}"
                  : "${context.watch<Courses>().studentCourses[index!]['CourseName']}",
              style: TextStyle(
                fontFamily: 'lexend',
                fontSize: kPrimaryFontSize * .20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            // Text(
            //   loginType == 0
            //       ? "${context.watch<Courses>().lecturerCourses[index!]['CourseDate']}"
            //       : "${context.watch<Courses>().studentCourses[index!]['CourseDate']}",
            //   style: TextStyle(
            //     fontFamily: 'lexend',
            //     fontSize: 16,
            //     fontWeight: FontWeight.w300,
            //     color: Colors.white,
            //   ),
            // ),
            Row(
              children: [
                SizedBox(
                  height: 16,
                  width: 16,
                  child: Image.asset(
                    "assets/images/user (1).png",
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 9),
                Text(
                  "$studentCount",
                  style: TextStyle(
                    fontFamily: 'lexend',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget courseQrCode() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Column(
        children: [
          SizedBox(height: kDefaultHeight * 3),
          if (loginType == 0) ToggleButton(toggleValue: true),
          SizedBox(height: kDefaultHeight * 2),
          QRCode(
            pin: 2222,
            qrCodeSrc: loginType == 0
                ? "${context.read<Courses>().lecturerCourses[context.watch<Courses>().selectedCourseIndex!]["QRcode"]}"
                : "${context.read<Courses>().studentCourses[context.watch<Courses>().selectedCourseIndex!]["QRcode"]}",
          ),
        ],
      ),
    );
  }
}
