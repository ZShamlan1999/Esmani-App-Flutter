import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:esmani_app/main.dart';
import 'package:esmani_app/utils/constant.dart';
import 'package:esmani_app/utils/crud.dart';
import 'package:esmani_app/utils/linkapi.dart';

class JoinToCourceDialog extends StatefulWidget {
  const JoinToCourceDialog({super.key});

  @override
  State<JoinToCourceDialog> createState() => _JoinToCourceDialogState();
}

class _JoinToCourceDialogState extends State<JoinToCourceDialog>{
  Crud crud = Crud();
  TextEditingController con = TextEditingController();
  String qr =
      'https://www.instagram.com/p/CTB1mRpHoex/?utm_source=ig_web_copy_link';
  int pinNum = 2244;
  String? result;
  bool pin = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      content: Container(
        height: 150,
        child: !pin
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  dialogButton(scanQRCode, 'QR'),
                  dialogButton(() {
                    setState(() => pin = true);
                  }, 'PIN'),
                ],
              )
            : checkPIN(),
      ),
    );
  }

  // Widget qrCodeScaner() {
  //   return Center(
  //     child: AnimatedContainer(
  //       duration: const Duration(milliseconds: 1000),
  //       curve: Curves.linear,
  //       height: !qrCoseVisibility ? 0 : 200,
  //       color: Colors.black12,
  //       width: double.infinity,
  //       child: QRcodeScanner(),
  //     ),
  //   );
  // }

  // MaterialButton convertToPIN() {
  //   return MaterialButton(
  //     onPressed: () {
  //       setState(() {
  //         qrCoseVisibility = !qrCoseVisibility;
  //         qrCoseVisibility
  //             ? buttonTitle = 'convert to PIN'
  //             : buttonTitle = 'convert to QRcode';
  //       });
  //     },
  //     color: kPrimaryColor,
  //     minWidth: kDefaultWidth * 20,
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  //     child: Text(
  //       buttonTitle,
  //       style: TextStyle(fontSize: fontSize16, color: Colors.white),
  //     ),
  //   );
  // }

  Widget pinTextFeild() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.linear,
      height: 40,
      child: TextFormField(
        controller: con,
        cursorColor: const Color(0xff535353),
        keyboardType: const TextInputType.numberWithOptions(),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            bottom: kDefaultHeight,
            left: kDefaultWidth,
          ),
          hintText: 'PIN: ',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  Widget dialogButton(VoidCallback onPressed, title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: MaterialButton(
        onPressed: onPressed,
        color: kPrimaryColor,
        minWidth: double.infinity,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      if (!mounted) return;
      // if (qrCode != qr && qrCode != '-1') errorSnackBar();
      setState(() => result = qrCode);
      print(result);
      print(
          "////////////////////////////////////////////////////////////////////////");
      joinToCourse();
      // Navigator.pop(context);
      // print(result);
      // print("===============================================================");
    } on PlatformException {
      result = 'Failed to scan QR';
    }
  }

  Widget checkPIN() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(child: pinTextFeild()),
        dialogButton(() {
          if (con.text != pinNum.toString()) {
            Navigator.pop(context);
            errorSnackBar();
          } else {
            setState(() => pin = false);
            Navigator.pop(context);
          }
        }, "OK")
      ],
    );
  }

  void errorSnackBar() {
    var snack = SnackBar(content: Text("QR is not correct!"));
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }

  joinToCourse() async {
    Map<String, dynamic> response = await crud.postRequest(
        linkJoinToCourseforStudent,
        {'qrCode': '$result', 'accountno': loginPreferences.getString('id')});

    if (response['status'] == 'Success') {
      Navigator.pop(context);
      print(
          "===================================================================");
    } else {
      Navigator.pop(context);
      errorSnackBar();
    }
  }
}
