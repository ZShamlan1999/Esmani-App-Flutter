// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:esmani_app/Screens/GenralScreens/main_home.dart';
import 'package:esmani_app/component/Other_Component/background_rounded_cards.dart';
import 'package:esmani_app/main.dart';
import 'package:esmani_app/utils/constant.dart';
import 'package:esmani_app/utils/crud.dart';
import 'package:esmani_app/utils/linkapi.dart';
import 'package:esmani_app/utils/provider.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> lecturerFormsState = GlobalKey();
  GlobalKey<FormState> studentFromState = GlobalKey();
  TextEditingController employeeId = TextEditingController();
  TextEditingController studentId = TextEditingController();
  bool obscurePassword = true;
  var isKeyboard;
  bool isLoading = false;
  Crud crud = Crud();

  @override
  Widget build(BuildContext context) {
    isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      body: Stack(
        children: [
          const TopRightRoundedCard(),
          if (!isKeyboard) const BottomLeftRoundedCard(),
          if (context.read<MyProvider>().loginType == 0)
            lecturerLoginBuilder(context),
          if (context.read<MyProvider>().loginType == 1)
            studentLoginBuilder(context),
          // if(Provider.of<MyProvider>(context).loginType =='Lecturer')
        ],
      ),
    );
  }

  lecturerLogin() async {
    if (lecturerFormsState.currentState!.validate()) {
      isLoading = true;
      setState(() {});
      var response =
          await crud.postRequest(linkLogin, {'EmployeeID': employeeId.text});
      isLoading = false;
      setState(() {});
      if (response["status"] == "Success") {
        loginPreferences.setString(
            'id', response["data"]['AccountNo'].toString());
        loginPreferences.setString('fullname', response["data"]['FullName']);
        loginPreferences.setString(
            'employeeid', response["data"]['EmployeeID'].toString());
        loginPreferences.setString(
            'image', response["data"]['Image'].toString());
        // savePrefs();
        var route = MaterialPageRoute(builder: (context) => const MainHome());

        Navigator.pushReplacement(context, route);
        print('Succesfully');
      } else {
        showDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            content: Text('Employee Id wrong Or is does not found'),
          ),
        );
        print('no');
      }
    }
  }

  studentLogin() async {
    if (studentFromState.currentState!.validate()) {
      isLoading = true;
      setState(() {});
      var response = await crud
          .postRequest(linkLoginStudent, {'studentid': studentId.text});
      isLoading = false;
      setState(() {});
      if (response["status"] == "Success") {
        loginPreferences.setString(
            'id', response["data"]['AccountNo'].toString());
        loginPreferences.setString('fullname', response["data"]['FullName']);
        loginPreferences.setString(
            'studentid', response["data"]['StudentID'].toString());
        loginPreferences.setString(
            'level', response["data"]['Level'].toString());
        var route = MaterialPageRoute(
          builder: (context) => const MainHome(),
        );

        Navigator.pushReplacement(context, route);
        print('Succesfully');
      } else {
        showDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            content: Text('Student Id wrong Or is does not found'),
          ),
        );
        print('no');
      }
    }
  }

  inputValidation(String val) {
    if (val.isEmpty) {
      return showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text("Error"),
            content: Text("This Field can't be Empty"),
          );
        },
      );
    }
  }

  Widget studentLoginBuilder(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.045,
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: screenHeight * 0.055,
              width: screenWidth * 0.10,
              child: Image.asset(
                "assets/images/logo.png",
                color: kPrimaryColor,
              ),
            ),
            SizedBox(height: screenHeight * 0.025),
            Center(
              child: const Text(
                "ESMANI",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontFamily: 'Jura',
                  fontSize: 23,
                  letterSpacing: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.035),
            Center(
              child: const Text(
                "login",
                style: TextStyle(
                  color: Color(0xff535353),
                  fontFamily: 'Jura',
                  fontSize: 23,
                  letterSpacing: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.095),
            Form(
              key: studentFromState,
              child: SizedBox(
                height: screenHeight * 0.062,
                child: TextFormField(
                  validator: (value) => inputValidation(value!),
                  controller: studentId,
                  cursorColor: const Color(0xff535353),
                  keyboardType: TextInputType.number,
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                    hintText: "Student ID",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.035),
            MaterialButton(
              minWidth: double.infinity,
              height: screenHeight * 0.062,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              onPressed: () async {
                await studentLogin();
              },
              color: kPrimaryColor,
              child: const Text(
                "Login",
                style: TextStyle(
                  color: kSecondaryColor,
                  fontFamily: 'Inter',
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.048),
          ],
        ),
      ),
    );
  }

  Widget lecturerLoginBuilder(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.045,
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            Center(
              child: SizedBox(
                height: screenHeight * 0.055,
                width: screenWidth * 0.10,
                child: Image.asset(
                  "assets/images/logo.png",
                  color: kPrimaryColor,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.025),
            const Center(
              child: Text(
                "ESMANI",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontFamily: 'Jura',
                  fontSize: 23,
                  letterSpacing: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.035),
            const Center(
              child: Text(
                "login",
                style: TextStyle(
                  color: Color(0xff535353),
                  fontFamily: 'Jura',
                  fontSize: 23,
                  letterSpacing: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.095),
            Form(
              key: lecturerFormsState,
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.062,
                    child: TextFormField(
                      validator: (val) => inputValidation(val!),
                      controller: employeeId,
                      cursorColor: const Color(0xff535353),
                      keyboardType: TextInputType.number,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                        hintText: "UserName or EmployeeID",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: kPrimaryFontSize * .22),
                  // SizedBox(
                  //   height: screenHeight * 0.062,
                  //   child: TextFormField(
                  //     obscureText: obscurePassword,
                  //     obscuringCharacter: '*',
                  //     cursorColor: const Color(0xff535353),
                  //     keyboardType: TextInputType.number,
                  //     textAlignVertical: TextAlignVertical.bottom,
                  //     decoration: InputDecoration(
                  //       suffixIcon: obscurePassword
                  //           ? GestureDetector(
                  //               onTap: () {
                  //                 setState(() {
                  //                   obscurePassword = false;
                  //                 });
                  //               },
                  //               child: const Icon(
                  //                 Icons.visibility,
                  //                 color: Colors.grey,
                  //               ),
                  //             )
                  //           : GestureDetector(
                  //               onTap: () {
                  //                 setState(() {
                  //                   obscurePassword = true;
                  //                 });
                  //               },
                  //               child: const Icon(
                  //                 Icons.visibility_off,
                  //                 color: Colors.grey,
                  //               ),
                  //             ),
                  //       hintText: "Password",
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(8),
                  //       ),
                  //       focusedBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(8),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.035),
            MaterialButton(
              minWidth: double.infinity,
              height: screenHeight * 0.062,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              onPressed: () async {
                await lecturerLogin();
                // var route =
                //     MaterialPageRoute(builder: (context) => const MainHome());
                //
                // Navigator.pushReplacement(context, route);
              },
              color: kPrimaryColor,
              child: const Text(
                "Login",
                style: TextStyle(
                  color: kSecondaryColor,
                  fontFamily: 'Inter',
                  fontSize: 18,
                ),
              ),
            ),
            if (!isKeyboard) SizedBox(height: screenHeight * 0.048),
          ],
        ),
      ),
    );
  }
}
