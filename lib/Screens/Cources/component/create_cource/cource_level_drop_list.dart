import 'package:flutter/material.dart';
import 'package:esmani_app/utils/constant.dart';
import 'package:esmani_app/utils/models/courses.dart';
import 'package:provider/provider.dart';

class CourseLevelDropList extends StatelessWidget {
  const CourseLevelDropList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? levelValue = context.watch<Courses>().courseLevel;
    final items = ['1', '2', '3', '4'];
    return Container(
      height: screenHeight * 0.062,
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Consumer<Courses>(
        builder: (context, value, child) {
          return DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              items: items.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    "Level ${item}",
                  ),
                );
              }).toList(),
              value: levelValue,
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
                value.changeCourseLevel(val!);
              },
            ),
          );
        },
      ),
    );
  }
}
