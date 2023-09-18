import 'package:flutter/material.dart';
import 'package:esmani_app/utils/constant.dart';

class FlotingAddButton extends StatelessWidget {
  const FlotingAddButton({
    Key? key,
    required this.screen,
  }) : super(key: key);

  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var route = MaterialPageRoute(
          builder: (context) => screen,
        );
        Navigator.pushReplacement(context, route);
      },
      child: Container(
        height: screenHeight * 0.09,
        width: screenHeight * 0.09,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black38.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Center(
            child: Icon(
              Icons.add_outlined,
              size: 35,
              color: kPrimaryColor,
            )),
      ),
    );
  }
}
