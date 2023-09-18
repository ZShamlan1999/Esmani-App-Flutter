import 'package:flutter/material.dart';
import 'package:esmani_app/utils/constant.dart';
import 'package:esmani_app/utils/models/courses.dart';
import 'package:provider/provider.dart';

class CourseHourDropList extends StatelessWidget {
  const CourseHourDropList({super.key});

  @override
  Widget build(BuildContext context) {
    final items = ['1', '2', '3'];
    String? hourValue = context.watch<Courses>().courseHour;
    return Container(
        height: screenHeight * 0.062,
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Consumer<Courses>(
          builder: (context, hourConsumer, child) {
            return DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                items: items.map((item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      "${item} hour",
                    ),
                  );
                }).toList(),
                value: hourValue,

                // isExpanded: true,
                style: const TextStyle(
                  color: Color(0xff232222),
                  fontSize: 16,
                  fontFamily: 'Lexend',
                ),
                hint: const Text(
                  "Hour",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Lexend',
                  ),
                ),
                onChanged: (value) {
                  hourConsumer.changeCourseHour(value!);
                },
              ),
            );
          },
        ));
  }
}
