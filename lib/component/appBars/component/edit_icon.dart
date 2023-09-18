import 'package:flutter/material.dart';
import 'package:esmani_app/utils/constant.dart';

class EditIconButton extends StatelessWidget {
  const EditIconButton({Key? key, required this.press}) : super(key: key);
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Icon(
        Icons.edit,
        color: kSecondaryColor,
        size: screenWidth * 0.06,
      ),
    );
  }
}
