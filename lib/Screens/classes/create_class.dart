import 'package:flutter/material.dart';
import 'package:esmani_app/Screens/Cources/component/create_cource/add_cource_image_card.dart';
import 'package:esmani_app/Screens/Cources/cource_details/classes_screen.dart';
import 'package:esmani_app/component/Other_Component/background_rounded_cards.dart';
import 'package:esmani_app/component/Other_Component/go_back_arrow.dart';
import 'package:esmani_app/main.dart';
import 'package:esmani_app/utils/constant.dart';
import 'package:esmani_app/utils/crud.dart';
import 'package:esmani_app/utils/linkapi.dart';
import 'package:esmani_app/utils/models/classes.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class CreateClass extends StatefulWidget {
  const CreateClass({super.key});

  @override
  State<CreateClass> createState() => _CreateClassState();
}

class _CreateClassState extends State<CreateClass> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController classNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  int questionParticipation = 1;
  int recordVoice = 1;

Crud crud =Crud();
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
          const GoBackArrow(title: 'Create Class', screen: ClassesScreen()),
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
                  classNameTextField(),
                  SizedBox(height: screenHeight * 0.022),
                  Row(
                    children: [
                      Expanded(flex: 3, child: questionParticipationCard()),
                      SizedBox(width: kDefaultWidth * 0.7),
                      Expanded(flex: 2, child: recordVoiceCard()),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.022),
                  chooseLecturerPDFButton(),
                  SizedBox(height: screenHeight * 0.022),
                  descriptionTextField(),
                  SizedBox(height: screenHeight * 0.022),
                  createButton(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  createClass() async {
    isLoading = true;
    setState(() {});
    var response = await crud.postRequest(linkAddClass, {
      'classname': classNameController.text,
      'classdate': "${DateTime.now()}",
      'pdflecture_path': "none".toString(),
      'sessionvoice_path': 'none'.toString(),
      'description': descriptionController.text,
      'questionpartespation': questionParticipation.toString(),
      'recordvoice': recordVoice.toString(),
      'isactive': 1.toString(),
      // 'image': 'none'.toString(),
      'qrcode': classNameController.text + DateTime.now().toString(),
      'pin': 12345.toString(),
      'courseid': context.read<Classes>().selectedCourseID.toString(),
      'lecturerid': loginPreferences.getString('id'),
    });
    isLoading = false;
    setState(() {});
    if (response['status'] == "Success") {
      var route =
          MaterialPageRoute(builder: (context) => const ClassesScreen());
      Navigator.pushReplacement(context, route);
      print('Done');
    } else {
      print('Error');
    }
  }

  Widget classNameTextField() {
    return SizedBox(
      height: screenHeight * 0.062,
      child: TextFormField(
        controller: classNameController,
        cursorColor: const Color(0xff535353),
        keyboardType: TextInputType.number,
        textAlignVertical: TextAlignVertical.bottom,
        style: const TextStyle(
          fontSize: 16,
          fontFamily: 'Lexend',
          color: Colors.black,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Class Name',
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

  Widget questionParticipationCard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultWidth * 0.5),
      height: kDefaultHeight * 4.5,
      decoration: BoxDecoration(
          color: kThirdColor, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => setState(() => questionParticipation == 0
                ? questionParticipation = 1
                : questionParticipation = 0),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: kDefaultWidth * 0.43,
                  vertical: kDefaultHeight * 0.3),
              height: kDefaultHeight * 4,
              width: kDefaultWidth * 4,
              decoration: BoxDecoration(
                color: questionParticipation == 0
                    ? const Color(0xffD0D0D0).withOpacity(0.12)
                    : const Color(0xff98F470),
                borderRadius: BorderRadius.circular(14),
              ),
              child: GestureDetector(
                child: Container(
                  height: kDefaultHeight * 3.5,
                  width: kDefaultWidth * 3.5,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4.1,
                        spreadRadius: 1,
                        color: Color(0xffC8C8C8),
                      )
                    ],
                    color: kThirdColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      questionParticipation == 0 ? "OFF" : "ON",
                      style: TextStyle(
                        fontFamily: 'lexend',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: kDefaultWidth * .05),
          Text(
            "Participation request",
            style: TextStyle(
              fontFamily: 'lexend',
              fontSize: 10.sp,
              color: const Color(0xff535353),
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }

  Widget recordVoiceCard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kDefaultWidth * 0.5),
      height: kDefaultHeight * 4.5,
      decoration: BoxDecoration(
          color: kThirdColor, borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => setState(
                () => recordVoice == 0 ? recordVoice = 1 : recordVoice = 0),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: kDefaultWidth * 0.43,
                  vertical: kDefaultHeight * 0.3),
              height: kDefaultHeight * 4,
              width: kDefaultWidth * 4,
              decoration: BoxDecoration(
                color: recordVoice == 0
                    ? const Color(0xffD0D0D0).withOpacity(0.12)
                    : const Color(0xff98F470),
                borderRadius: BorderRadius.circular(14),
              ),
              child: GestureDetector(
                child: Container(
                  height: kDefaultHeight * 3.5,
                  width: kDefaultWidth * 3.5,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4.1,
                        spreadRadius: 1,
                        color: Color(0xffC8C8C8),
                      )
                    ],
                    color: kThirdColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      recordVoice == 0 ? "OFF" : "ON",
                      style: TextStyle(
                        fontFamily: 'lexend',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: kDefaultWidth * .05),
          Text(
            "Record voice",
            style: TextStyle(
              fontFamily: 'lexend',
              fontSize: 10.sp,
              color: const Color(0xff535353),
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }

  Widget chooseLecturerPDFButton() {
    return MaterialButton(
      onPressed: () {},
      height: kDefaultHeight * 4.55,
      color: kThirdColor,
      elevation: 0,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: kDefaultHeight * 3,
            width: kDefaultHeight * 3,
            child: Image.asset('assets/images/pdf_icon.png'),
          ),
          SizedBox(width: kDefaultWidth * 0.5),
          Text(
            'Choose Lecture PDF',
            style: TextStyle(
              fontFamily: 'lexend',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xff5b5b5b),
            ),
          ),
        ],
      ),
    );
  }

  Widget descriptionTextField() {
    return SizedBox(
      height: kDefaultHeight * 8.4,
      child: TextFormField(
        controller: descriptionController,
        textAlignVertical: TextAlignVertical.top,
        maxLines: 6,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Note',
          hintStyle: TextStyle(
            fontSize: 14.sp,
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

  Widget createButton() {
    return MaterialButton(
      height: kDefaultHeight * 6.4,
      onPressed: () => createClass(),
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
}
