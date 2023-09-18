import 'dart:async';

import 'package:flutter/material.dart';
import 'package:esmani_app/main.dart';
import 'package:esmani_app/utils/constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 4),
      () {
        var route = MaterialPageRoute(builder: (context) => const MyHomePage());
        Navigator.pushReplacement(context, route);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 3),
              SizedBox(
                height: 60,
                width: 60,
                child: Image.asset('assets/images/logo.png', fit: BoxFit.cover),
              ),
              const SizedBox(height: 20),
              const Text(
                "ESMANI",
                style: TextStyle(
                  fontFamily: 'Jura',
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  letterSpacing: 16,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Open a session and start talking to your students ",
                style: TextStyle(
                  fontFamily: 'lexend',
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 2),
              CircularProgressIndicator(
                backgroundColor: Colors.white.withOpacity(.5),
                color: kPrimaryColor.withOpacity(0.5),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
