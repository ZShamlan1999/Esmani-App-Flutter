import 'package:flutter/material.dart';
import 'package:esmani_app/utils/constant.dart';

class AddCourseImageCard extends StatelessWidget {
  const AddCourseImageCard({
    Key? key,
    this.image = '',
  }) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: screenHeight * 0.167,
          width: screenHeight * 0.167,
          child: Stack(
            children: [
              Center(
                child: Container(
                  height: screenHeight * 0.167,
                  width: screenHeight * 0.167,
                  decoration: BoxDecoration(
                    color: const Color(0xffD9D9D9),
                    borderRadius: BorderRadius.circular(100),
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
                        : const Icon(
                            Icons.camera_alt_rounded,
                            color: Colors.white,
                            size: 40,
                          ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: screenHeight * 0.01,
                    right: screenHeight * 0.01,
                  ),
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: const Color(0xffABABAB),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
