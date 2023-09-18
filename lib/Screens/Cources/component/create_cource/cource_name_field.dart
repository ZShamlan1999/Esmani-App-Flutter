import 'package:flutter/material.dart';
import 'package:esmani_app/utils/constant.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({
    Key? key,
    required this.hint,
  }) : super(key: key);
  final String hint;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.062,
      child: TextFormField(
        cursorColor: const Color(0xff535353),
        keyboardType: TextInputType.number,
        textAlignVertical: TextAlignVertical.bottom,
        style: const TextStyle(
          fontSize: 16,
          fontFamily: 'Lexend',
          color: Colors.black,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hint,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontFamily: 'Lexend',
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
