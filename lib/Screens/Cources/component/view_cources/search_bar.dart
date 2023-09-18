import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:esmani_app/utils/constant.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({
    Key? key,
    this.placeHolder = "",
  }) : super(key: key);
  final String placeHolder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.0415,
      child: CupertinoSearchTextField(
        prefixIcon: Icon(
          CupertinoIcons.search,
          size: kPrimaryFontSize * 0.3,
          color: Colors.white,
        ),
        placeholder: placeHolder,
        padding: EdgeInsets.only(left: screenWidth * 0.039),
        placeholderStyle: TextStyle(
          fontSize: kPrimaryFontSize * .16,
          fontFamily: 'lexend',
          color: const Color(0xff383838),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: const Color(0xffD1D1D1),
        ),
      ),
    );
  }
}
