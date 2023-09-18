import 'package:flutter/material.dart';
import 'package:esmani_app/utils/constant.dart';
import 'package:esmani_app/utils/models/courses.dart';
import 'package:provider/provider.dart';

class CourcePeriodDropList extends StatelessWidget {
  const CourcePeriodDropList({super.key});

  @override
  Widget build(BuildContext context) {
    String? periodValue = context
        .watch<Courses>()
        .coursePeriod;
    final items = ['General', 'Parallel'];

    return Container(
      height: screenHeight * 0.062,
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Consumer<Courses>(
        builder: (context, periodConsumer, child) {
          return DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              items: items.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                  ),
                );
              }).toList(),
              value: periodValue,
              // isExpanded: true,

              style: const TextStyle(
                color: Color(0xff232222),
                fontSize: 16,
                fontFamily: 'Lexend',
              ),
              hint: const Text(
                "Period",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Lexend',
                ),
              ),
              onChanged: (val) {
                periodConsumer.changeCoursePeriod(val!);
              },
            ),
          );
        },
      ),
    );
  }
}
