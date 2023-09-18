import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:esmani_app/Screens/GenralScreens/spalsh_screen.dart';
import 'package:esmani_app/Screens/GenralScreens/welcome_screen.dart';
import 'package:esmani_app/utils/constant.dart';
import 'package:esmani_app/utils/models/classes.dart';
import 'package:esmani_app/utils/models/courses.dart';
import 'package:esmani_app/utils/models/lecturers.dart';
import 'package:esmani_app/utils/models/studnts.dart';
import 'package:esmani_app/utils/provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:wakelock/wakelock.dart';

late SharedPreferences loginPreferences;

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  WidgetsFlutterBinding.ensureInitialized();
  loginPreferences = await SharedPreferences.getInstance();
  Wakelock.enable();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MyProvider()),
        ChangeNotifierProvider(create: (context) => Students()),
        ChangeNotifierProvider(create: (context) => Lecturers()),
        ChangeNotifierProvider(create: (context) => Courses()),
        ChangeNotifierProvider(create: (context) => Classes()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'lexend',
          primaryColor: kPrimaryColor,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double topPadding = MediaQuery.of(context).padding.top;
    screenHeight = MediaQuery.of(context).size.height - topPadding;
    screenWidth = MediaQuery.of(context).size.width;
    return Sizer(builder: (context, orientation, deviceType) => Welcome());
  }
}
