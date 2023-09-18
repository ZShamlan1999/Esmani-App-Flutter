import 'package:flutter/material.dart';
import 'package:esmani_app/utils/constant.dart';

class BottomLeftRoundedCard extends StatelessWidget {
  const BottomLeftRoundedCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Image.asset(
        "assets/images/bottom_left_corner.png",
        height: screenHeight * 0.17,
      ),
    );
  }
}

class TopRightRoundedCard extends StatelessWidget {
  const TopRightRoundedCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Image.asset(
        "assets/images/top_rhight_corner.png",
        height: screenHeight * 0.20,
      ),
    );
  }
}
