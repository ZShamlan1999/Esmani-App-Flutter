// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:esmani_app/utils/constant.dart';

class QRCode extends StatelessWidget {
  QRCode({Key? key, required this.pin, this.qrCodeSrc}) : super(key: key);
  final int pin;
  String? qrCodeSrc;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => openQRCodeDialog(context),
      child: SizedBox(
        height: kDefaultHeight * 3.4,
        width: kDefaultHeight * 3.4,
        child: Image.asset("assets/images/QRcode.png"),
      ),
    );
  }

  Future openQRCodeDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
            // class PIN number
            title: Text('PIN: $pin'),
            // class QR code
            content: Container(
              color: Colors.white,
              height: kDefaultHeight * 20,
              width: kDefaultHeight * 20,
              child: FittedBox(
                // child: QrImage(
                //   data: qrCodeSrc!,
                //   version: QrVersions.auto,
                //   size: 50,
                // ),
              ),
            ));
      },
    );
  }
}
