import 'package:flutter/material.dart';
import 'package:esmani_app/utils/constant.dart';
import 'package:esmani_app/utils/models/studnts.dart';
import 'package:provider/provider.dart';

class StudentNavBar extends StatelessWidget {
  const StudentNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int currentIndex = context.watch<Students>().homePageIndex;
    return Consumer<Students>(
      builder: (context, value, child) {
        return BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: kPrimaryColor,
          currentIndex: currentIndex,
          onTap: (int index) => value.changeIndex(index),
          items: [
            home(currentIndex: currentIndex),
            profile(currentIndex: currentIndex),
          ],
        );
      },
    );
  }

  BottomNavigationBarItem profile({required int currentIndex}) {
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: screenHeight * 0.038,
                width: currentIndex == 1 ? screenWidth * 0.142 : 0,
                curve: Curves.linear,
                decoration: BoxDecoration(
                  color: currentIndex == 1
                      ? const Color(0xff256B6B)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.038,
                width: screenWidth * 0.142,
                child: Center(
                  child: SizedBox(
                    height: screenHeight * 0.028,
                    child: Image.asset(
                      "assets/images/user (5).png",
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.007),
          const Text(
            "Profile",
            style: TextStyle(
              fontFamily: 'Inter',
              color: Colors.white,
            ),
          )
        ],
      ),
      label: "",
    );
  }

  BottomNavigationBarItem home({required int currentIndex}) {
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: screenHeight * 0.038,
                width: currentIndex == 0 ? screenWidth * 0.142 : 0,
                curve: Curves.linear,
                decoration: BoxDecoration(
                  color: currentIndex == 0
                      ? const Color(0xff256B6B)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.038,
                width: screenWidth * 0.142,
                child: Center(
                  child: SizedBox(
                    height: screenHeight * 0.035,
                    child: Image.asset(
                      "assets/images/icons8-home-48.png",
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.007),
          const Text(
            "Home",
            style: TextStyle(
              fontFamily: 'Inter',
              color: Colors.white,
            ),
          )
        ],
      ),
      label: "",
    );
  }
}
