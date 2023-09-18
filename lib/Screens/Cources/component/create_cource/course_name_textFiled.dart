import 'package:flutter/material.dart';
import 'package:esmani_app/utils/constant.dart';
import 'package:esmani_app/utils/models/courses.dart';
import 'package:provider/provider.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return SizedBox(
      height: screenHeight * 0.062,
      child: Consumer<Courses>(
        builder: (context, courseNameConsumer, child) {
          return TextFormField(
            controller: _controller,
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
              hintText: 'Course Name',
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
            onEditingComplete: () {
              print(
                  "===========================================================");
            },
          );
        },
      ),
    );
  }
}
