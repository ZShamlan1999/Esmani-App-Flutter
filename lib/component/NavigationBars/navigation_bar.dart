import 'package:flutter/material.dart';
import 'package:esmani_app/utils/constant.dart';
import 'package:esmani_app/utils/provider.dart';
import 'package:provider/provider.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    var currentIndex = Provider.of<MyProvider>(context, listen: false).index;
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: kPrimaryColor,
      currentIndex: currentIndex,
      onTap: (int index) {
        setState(() {
          Provider.of<MyProvider>(context, listen: false).index = index;

          // var studentRoute = MaterialPageRoute(
          //   builder: (context) => const Students(),
          // );
          // var homeRoute = MaterialPageRoute(
          //   builder: (context) => const Home(),
          // );

          // if (Provider.of<MyProvider>(context, listen: false).index == 0) {
          //   Navigator.pushReplacement(context, studentRoute);
          // }
          // if (Provider.of<MyProvider>(context, listen: false).index == 1) {
          //   Navigator.pushReplacement(context, homeRoute);
          // }
        });
      },
      items: [
        student(currentIndex: currentIndex),
        home(currentIndex: currentIndex),
        profile(currentIndex: currentIndex),
      ],
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
                height: 30,
                width: currentIndex == 2 ? 57 : 0,
                curve: Curves.linear,
                decoration: BoxDecoration(
                  color: currentIndex == 2
                      ? const Color(0xff256B6B)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                height: 30,
                width: 57,
                child: Center(
                  child: SizedBox(
                    height: 22,
                    child: Image.asset(
                      "assets/images/user (5).png",
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
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
                height: 30,
                width: currentIndex == 1 ? 57 : 0,
                curve: Curves.linear,
                decoration: BoxDecoration(
                  color: currentIndex == 1
                      ? const Color(0xff256B6B)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                height: 30,
                width: 57,
                child: Center(
                  child: SizedBox(
                    height: 27,
                    child: Image.asset(
                      "assets/images/icons8-home-48.png",
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
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

  BottomNavigationBarItem student({required int currentIndex}) {
    Future.delayed(const Duration(seconds: 5));
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: 30,
                width: currentIndex == 0 ? 57 : 0,
                curve: Curves.linear,
                decoration: BoxDecoration(
                  color: currentIndex == 0
                      ? const Color(0xff256B6B)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                height: 30,
                width: 57,
                child: Center(
                  child: SizedBox(
                    height: 30,
                    child: Image.asset(
                      "assets/images/icons8-user-groups-64.png",
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const Text(
            "Student",
            style: TextStyle(
              fontFamily: 'Inter',
              color: Colors.white,
            ),
          ),
        ],
      ),
      label: "",
    );
  }
}
