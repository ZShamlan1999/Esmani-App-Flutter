// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:esmani_app/utils/constant.dart';

class ToggleButton extends StatefulWidget {
  ToggleButton({Key? key, required this.toggleValue}) : super(key: key);
  bool toggleValue;

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(
          () {
            widget.toggleValue = !widget.toggleValue;
          },
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        height: kDefaultHeight * 2.6,
        width: kDefaultWidth * 4.7,
        padding: EdgeInsets.symmetric(horizontal: kDefaultWidth * 0.3),
        decoration: BoxDecoration(
          color: const Color(0xffBFBFBF).withOpacity(0.63),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeIn,
              top: kDefaultWidth * 0.3,
              left: widget.toggleValue ? kDefaultWidth * 2 : 0.0,
              right: widget.toggleValue ? 0.0 : kDefaultWidth * 2,
              child: widget.toggleValue
                  ? Container(
                      height: kDefaultHeight * 2,
                      width: kDefaultWidth * 2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: FittedBox(
                        child: Icon(
                          Icons.lock_open,
                          key: UniqueKey(),
                        ),
                      ),
                    )
                  : Container(
                      height: kDefaultHeight * 2,
                      width: kDefaultWidth * 2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: FittedBox(
                        child: Icon(
                          Icons.lock,
                          key: UniqueKey(),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
