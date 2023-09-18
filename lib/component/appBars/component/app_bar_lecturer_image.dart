import 'package:flutter/material.dart';
import 'package:esmani_app/utils/constant.dart';
import 'package:esmani_app/utils/provider.dart';
import 'package:provider/provider.dart';

class AppBarLecturerImage extends StatelessWidget {
  const AppBarLecturerImage({Key? key, this.image = ''}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    var lecturerMic =
        Provider.of<MyProvider>(context, listen: false).lecturerMicIsOn;
    return SizedBox(
      height: screenHeight * .10,
      width: screenHeight * .10,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: screenHeight * .10,
              width: screenHeight * .10,
              padding: EdgeInsets.all(screenWidth * .0076),
              decoration: BoxDecoration(
                color: lecturerMic ? Colors.green : kThirdColor,
                borderRadius: BorderRadius.circular(screenHeight * .132),
              ),
              child: GestureDetector(
                onTap: () {},
                child: image.isNotEmpty
                    ? CircleAvatar(
                        backgroundColor: const Color(0xffD9D9D9),
                        foregroundImage: image.isNotEmpty
                            ? AssetImage(image)
                            : const AssetImage('assets/images/camera.png'),
                      )
                    : Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.white,
                        size: screenWidth * .051,
                      ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: screenHeight * .029,
              width: screenHeight * .029,
              decoration: BoxDecoration(
                  color: lecturerMic ? Colors.green : const Color(0xffeeeeee),
                  borderRadius: BorderRadius.circular(screenWidth * .051),
                  border: Border.all(
                    width: 1,
                    color: Colors.white,
                  )),
              child: FittedBox(
                child: Icon(
                  Icons.keyboard_voice,
                  color: lecturerMic ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
