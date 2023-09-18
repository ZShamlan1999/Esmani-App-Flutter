import 'package:flutter/material.dart';
import 'package:esmani_app/component/appBars/component/app_bar_lecturer_image.dart';
import 'package:esmani_app/component/appBars/component/qr_code.dart';
import 'package:esmani_app/utils/constant.dart';

class LecturerDetailsAndQRcode extends StatelessWidget {
  const LecturerDetailsAndQRcode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * .051),
      child: Column(
        children: [
          Row(
            children: [
              const AppBarLecturerImage(image: 'assets/images/hussin.png'),
              SizedBox(width: kDefaultWidth * 1.5),
              lecturerName('Mohammed Bin Shahbal'),
              const Spacer(),
              QRCode(pin: 1234, qrCodeSrc: "assets/images/QRcode.png"),
            ],
          ),
        ],
      ),
    );
  }

  Widget lecturerName(String lecturerName) {
    return Text(
      lecturerName,
      style: TextStyle(
        fontFamily: 'inter',
        fontSize: fontSize16,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    );
  }
}
