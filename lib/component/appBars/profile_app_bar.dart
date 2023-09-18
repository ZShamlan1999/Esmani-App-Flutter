import 'package:flutter/material.dart';
import 'package:esmani_app/utils/constant.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: kDefaultHeight,
                width: kDefaultWidth,
                color: kPrimaryColor),
            SizedBox(width: kDefaultWidth * 1.2),
            Text(
              'My Profile',
              style: TextStyle(
                fontSize: fontSize20 * 1.5,
                fontFamily: 'lexend',
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
        SizedBox(height: kDefaultHeight),
        const Divider(thickness: 1, color: Color(0xffB6B6B6)),
        SizedBox(height: kDefaultHeight * 2),
      ],
    );
  }
}
