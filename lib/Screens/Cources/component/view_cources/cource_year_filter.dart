import 'package:flutter/material.dart';
import 'package:esmani_app/utils/constant.dart';

class CourcesYearFilter extends StatefulWidget {
  const CourcesYearFilter({
    Key? key,
  }) : super(key: key);

  @override
  State<CourcesYearFilter> createState() => _CourcesYearFilterState();
}

class _CourcesYearFilterState extends State<CourcesYearFilter> {
  final items = [
    "2019-2020",
    "2020-2021",
    "2021-2022",
    "2022-2023",
    "2013-2024"
  ];
  String? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: screenWidth * 0.026),
      height: screenHeight * 0.0415,
      padding: EdgeInsets.only(left: screenWidth * 0.015),
      decoration: BoxDecoration(
        color: const Color(0xffD1D1D1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
              ),
            );
          }).toList(),
          value: value,

          // isExpanded: true,
          style: TextStyle(
            color: const Color(0xff232222),
            fontFamily: 'Lexend',
            fontSize: kPrimaryFontSize * 0.12,
          ),
          hint: Text(
            "2019-2020",
            style: TextStyle(
              fontFamily: 'lexend',
              fontSize: kPrimaryFontSize * 0.12,
              color: const Color(0xff383838),
            ),
          ),
          onChanged: (value) {
            setState(() {
              this.value = value;
            });
          },
        ),
      ),
    );
  }
}
