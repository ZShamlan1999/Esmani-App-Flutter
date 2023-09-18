import 'package:flutter/material.dart';
import 'package:esmani_app/utils/constant.dart';

class JoinToClassDialog extends StatefulWidget {
  const JoinToClassDialog({super.key});

  @override
  State<JoinToClassDialog> createState() => _JoinToClassDialogState();
}

class _JoinToClassDialogState extends State<JoinToClassDialog> {
  bool qrCoseVisibility = true;
  String buttonTitle = 'convert to PIN';
  TextEditingController con = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(
          horizontal: kDefaultWidth * 0.5, vertical: kDefaultHeight),
      content: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        height: qrCoseVisibility ? 250 : 100,
        curve: Curves.linear,
        width: double.infinity,
        child: Column(
          // shrinkWrap: true,
          children: [
            qrCodeScaner(),
            pinTextFeild(),
            convertToPIN(),
          ],
        ),
      ),
    );
  }

  Widget qrCodeScaner() {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.linear,
        height: !qrCoseVisibility ? 0 : 200,
        color: Colors.black12,
        width: double.infinity,
      ),
    );
  }

  MaterialButton convertToPIN() {
    return MaterialButton(
      onPressed: () {
        setState(() {
          qrCoseVisibility = !qrCoseVisibility;
          qrCoseVisibility
              ? buttonTitle = 'convert to PIN'
              : buttonTitle = 'convert to QRcode';
        });
      },
      color: kPrimaryColor,
      minWidth: kDefaultWidth * 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Text(
        buttonTitle,
        style: TextStyle(fontSize: fontSize16, color: Colors.white),
      ),
    );
  }

  Widget pinTextFeild() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.linear,
      height: qrCoseVisibility ? 0 : 40,
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
}
