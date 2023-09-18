import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:esmani_app/utils/constant.dart';

class GoBackArrow extends StatelessWidget {
  const GoBackArrow({
    Key? key,
    required this.title,
    required this.screen,
    this.onTap,
  }) : super(key: key);

  final String title;
  final Widget screen;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: screenWidth * 0.045,
          top: screenHeight * 0.05,
          right: screenWidth * 0.045,
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                var route = MaterialPageRoute(
                  builder: (context) => screen,
                );
                Navigator.pushReplacement(context, route);
              },
              child: SvgPicture.asset(
                "assets/icons/left_arrow.svg",
                // ignore: deprecated_member_use
                color: Colors.black,
              ),
            ),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Lexend',
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
