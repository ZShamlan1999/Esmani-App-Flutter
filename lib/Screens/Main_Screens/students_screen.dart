import 'package:flutter/material.dart';
import 'package:esmani_app/Screens/Cources/component/view_cources/search_bar.dart';
import 'package:esmani_app/component/appBars/app_bar.dart';
import 'package:esmani_app/utils/constant.dart';

class StudentsScreen extends StatelessWidget {
  const StudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const EsmaniAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultWidth * 1.5,
              vertical: kDefaultHeight * 1.2,
            ),
            child: const SearchCard(placeHolder: "Search for Student"),
          ),
          SizedBox(
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(height: kDefaultHeight * 17),
                Icon(
                  Icons.search,
                  size: kDefaultWidth * 5,
                  color: const Color(0xff5B5B5B),
                ),
                Center(
                  child: Text(
                    "Search for student",
                    style: TextStyle(
                      fontFamily: "Lexend",
                      fontWeight: FontWeight.w300,
                      fontSize: fontSize20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
