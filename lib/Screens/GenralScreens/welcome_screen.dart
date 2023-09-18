import 'package:flutter/material.dart';
import 'package:esmani_app/Screens/GenralScreens/login.dart';
import 'package:esmani_app/component/Other_Component/background_rounded_cards.dart';
import 'package:esmani_app/utils/constant.dart';
import 'package:esmani_app/utils/provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TopRightRoundedCard(),
          BottomLeftRoundedCard(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logo(),
              SizedBox(height: kDefaultHeight * 2),
              appName(),
              SizedBox(height: kDefaultHeight * 2.7),
              welcomeTitle(),
              SizedBox(height: kDefaultHeight * 7.45),
              lecturerButton(context),
              SizedBox(height: kDefaultHeight * 1.2),
              studentButton(context),
              SizedBox(height: kDefaultHeight * 3.7),
            ],
          )
        ],
      ),
    );
  }

  Widget logo() {
    return SizedBox(
      height: screenHeight * 0.055,
      width: screenWidth * 0.10,
      child: Image.asset(
        "assets/images/logo.png",
        color: kPrimaryColor,
      ),
    );
  }

  Widget appName() {
    return Text(
      "ESMANI",
      style: TextStyle(
        color: kPrimaryColor,
        fontFamily: 'Jura',
        fontSize: 23.sp,
        letterSpacing: 10.sp,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget welcomeTitle() {
    return Text(
      "Welcome",
      style: TextStyle(
        color: Color(0xff535353),
        fontFamily: 'Jura',
        fontSize: 23.sp,
        letterSpacing: 10.sp,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget studentButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultWidth * 1.6),
      child: Consumer<MyProvider>(
        builder: (context, value, child) {
          return MaterialButton(
            color: kPrimaryColor,
            minWidth: double.infinity,
            height: kDefaultHeight * 4.8,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.sp),
              borderSide: BorderSide.none,
            ),
            onPressed: () {
              value.DefineLoginType(1);
              var route =
                  MaterialPageRoute(builder: (context) => const Login());
              Navigator.push(context, route);
            },
            child: Text(
              "Student",
              style: TextStyle(
                color: kSecondaryColor,
                fontFamily: 'Inter',
                fontSize: 14.sp,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget lecturerButton(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultWidth * 1.6),
        child: Consumer<MyProvider>(
          builder: (context, value, child) {
            return MaterialButton(
              minWidth: double.infinity,
              height: kDefaultHeight * 4.8,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.sp),
                borderSide: BorderSide.none,
              ),
              onPressed: () {
                value.DefineLoginType(0);
                var route =
                    MaterialPageRoute(builder: (context) => const Login());
                Navigator.push(context, route);
              },
              color: kPrimaryColor,
              child: Text(
                "Lecturer",
                style: TextStyle(
                  color: kSecondaryColor,
                  fontFamily: 'Inter',
                  fontSize: 14.sp,
                ),
              ),
            );
          },
        ));
  }
}
