import 'package:flutter/material.dart';
import 'package:esmani_app/Screens/GenralScreens/main_home.dart';
import 'package:esmani_app/Screens/Cources/component/create_cource/add_cource_image_card.dart';
import 'package:esmani_app/component/Other_Component/background_rounded_cards.dart';
import 'package:esmani_app/component/Other_Component/go_back_arrow.dart';
import 'package:esmani_app/main.dart';
import 'package:esmani_app/utils/constant.dart';
import 'package:esmani_app/utils/crud.dart';
import 'package:esmani_app/utils/linkapi.dart';

class CreateCource extends StatefulWidget {
  const CreateCource({super.key});

  @override
  State<CreateCource> createState() => _CreateCourceState();
}

class _CreateCourceState extends State<CreateCource> {
  Crud crud = Crud();
  String? courseHour;
  String? courseLevel;
  String? coursePeriod;
  String? courseDepartment;
  GlobalKey<FormState> fromState = GlobalKey();
  TextEditingController courseNameController = TextEditingController();
  final date = DateTime.now().year;
  bool isLocked = true;
  String? data;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      backgroundColor: const Color(0xffEDEDED),
      body: Stack(
        children: [
          const TopRightRoundedCard(),
          if (!isKeyboard) const BottomLeftRoundedCard(),
          GoBackArrow(title: 'Create Course', screen: MainHome()),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.045),
              margin:
                  EdgeInsets.only(top: isKeyboard ? screenHeight * 0.13 : 0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  const AddCourseImageCard(),
                  SizedBox(height: screenHeight * 0.048),
                  courseNameField(),
                  SizedBox(height: screenHeight * 0.022),
                  Row(
                    children: [
                      Expanded(flex: 2, child: courseDepartmentDropList()),
                      SizedBox(width: 6),
                      Expanded(child: courseHourDropList()),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.022),
                  Row(
                    children: [
                      Expanded(flex: 2, child: coursePeriodDropList()),
                      SizedBox(width: 6),
                      Expanded(child: courseLevelDropList()),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.038),
                  createButton(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget createButton() {
    return MaterialButton(
      height: screenHeight * 0.062,
      onPressed: () async => await createCourse(),
      color: kPrimaryColor,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      child: const Center(
        child: Text(
          'CREATE',
          style: TextStyle(
            fontFamily: 'Lexend',
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget courseNameField() {
    return SizedBox(
      height: screenHeight * 0.062,
      child: TextFormField(
        controller: courseNameController,
        cursorColor: const Color(0xff535353),
        keyboardType: TextInputType.text,
        textAlignVertical: TextAlignVertical.bottom,
        style: const TextStyle(
          fontSize: 16,
          fontFamily: 'Lexend',
          color: Colors.black,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: "Course Name",
          hintStyle: const TextStyle(
            fontSize: 16,
            fontFamily: 'Lexend',
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget courseHourDropList() {
    final items = ['1', '2', '3'];

    return Container(
      height: screenHeight * 0.062,
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text("${item} hour"),
            );
          }).toList(),
          value: courseHour,

          // isExpanded: true,
          style: const TextStyle(
              color: Color(0xff232222), fontSize: 16, fontFamily: 'Lexend'),
          hint: const Text(
            "Hour",
            style: TextStyle(fontSize: 16, fontFamily: 'Lexend'),
          ),
          onChanged: (value) {
            setState(() {
              courseHour = value;
            });
          },
        ),
      ),
    );
  }

  Widget courseLevelDropList() {
    final items = ['1', '2', '3', '4'];
    return Container(
        height: screenHeight * 0.062,
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            items: items.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  "Level ${item}",
                ),
              );
            }).toList(),
            value: courseLevel,
            // isExpanded: true,

            style: const TextStyle(
              color: Color(0xff232222),
              fontSize: 16,
              fontFamily: 'Lexend',
            ),
            hint: const Text(
              "Level",
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Lexend',
              ),
            ),
            onChanged: (val) {
              setState(() {
                courseLevel = val;
              });
            },
          ),
        ));
  }

  Widget coursePeriodDropList() {
    final items = ['General', 'Parallel'];

    return Container(
      height: screenHeight * 0.062,
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
              ),
            );
          }).toList(),
          value: coursePeriod,
          // isExpanded: true,

          style: const TextStyle(
            color: Color(0xff232222),
            fontSize: 16,
            fontFamily: 'Lexend',
          ),
          hint: const Text(
            "Period",
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Lexend',
            ),
          ),
          onChanged: (val) {
            setState(() {
              coursePeriod = val;
            });
          },
        ),
      ),
    );
  }

  Widget courseDepartmentDropList() {
    final items = ['IT', 'CS'];
    return Container(
      height: screenHeight * 0.062,
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
              ),
            );
          }).toList(),
          value: courseDepartment,
          isExpanded: false,
          style: const TextStyle(
            color: Color(0xff232222),
            fontSize: 16,
            fontFamily: 'Lexend',
          ),
          hint: const Text(
            "Department",
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Lexend',
            ),
          ),
          onChanged: (val) {
            setState(() {
              courseDepartment = val;
            });
          },
        ),
      ),
    );
  }

  createCourse() async {
    isLoading = true;
    setState(() {});
    var response = await crud.postRequest(linkAddCourse, {
      "coursename": courseNameController.text,
      "courselevel": courseLevel.toString(),
      "departemnt": courseDepartment.toString(),
      "period": coursePeriod.toString(),
      "coursehour": courseHour.toString(),
      "coursedate": date.toString(),
      "islocked": isLocked.toString(),
      "Qrcode": courseNameController.text + date.toString(),
      "pin": 12345.toString(),
      'lecturerid': loginPreferences.getString('id'),
    });
    isLoading = false;
    setState(() {});
    if (response['status'] == "Success") {
      var route = MaterialPageRoute(builder: (context) => const MainHome());
      Navigator.pushReplacement(context, route);
      print('Done');
    } else {
      print('Error');
    }
  }
}
