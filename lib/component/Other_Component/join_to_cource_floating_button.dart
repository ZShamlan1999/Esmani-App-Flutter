import 'package:flutter/material.dart';
import 'package:esmani_app/utils/constant.dart';

class JoinToCourceFloatingButton extends StatelessWidget {
  const JoinToCourceFloatingButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        height: kDefaultHeight * 8,
        width: kDefaultWidth * 8,
        decoration: BoxDecoration(
          color: kPrimaryColor,
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
          child: Text(
            "JOIN",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
