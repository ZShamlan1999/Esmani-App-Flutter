import 'package:flutter/material.dart';
import 'package:esmani_app/utils/constant.dart';
import 'package:esmani_app/utils/models/courses.dart';
import 'package:provider/provider.dart';

class CourceDepartmentDropList extends StatelessWidget {
  const CourceDepartmentDropList({super.key});

  @override
  Widget build(BuildContext context) {
    final items = ['IT', 'CS'];
    String? departmentValue = context.watch<Courses>().courseDepartment;
    return Container(
      height: screenHeight * 0.062,
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Consumer<Courses>(
        builder: (context, departmentConsumer, child) {
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
              value: departmentValue,
              isExpanded: false,
              style: const TextStyle(
                color: Color(0xff232222),
                fontSize: 16,
                fontFamily: 'Lexend',
              ),
              hint: const Text(
                "Department",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Lexend',
                ),
              ),
              onChanged: (val) {
                departmentConsumer.changeCourseDepartment(val!);
              },
            ),
          );
        },
      ),
    );
  }
}
