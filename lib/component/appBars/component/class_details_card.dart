import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:esmani_app/Screens/attendance/attendance_screen.dart';
import 'package:esmani_app/Screens/classes/create_class.dart';
import 'package:esmani_app/component/appBars/component/edit_icon.dart';
import 'package:esmani_app/component/appBars/component/qr_code.dart';
import 'package:esmani_app/component/appBars/component/toggle_button.dart';
import 'package:esmani_app/utils/constant.dart';
import 'package:esmani_app/utils/models/classes.dart';
import 'package:esmani_app/utils/provider.dart';
import 'package:provider/provider.dart';

class ClassDetailsCard extends StatefulWidget {
  const ClassDetailsCard({Key? key}) : super(key: key);

  @override
  State<ClassDetailsCard> createState() => _ClassDetailsCardState();
}

class _ClassDetailsCardState extends State<ClassDetailsCard> {
  var route = MaterialPageRoute(builder: (context) => const CreateClass());

  @override
  Widget build(BuildContext context) {
    int classIsActive = context
            .watch<Classes>()
            .lecturerClasses[context.watch<Classes>().selectedClassIndex!]
        ['IsActive'];
    int loginType = context.watch<MyProvider>().loginType!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultWidth * 2),
      child: Column(
        children: [
          SizedBox(height: kDefaultHeight * 1.3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              cancelIcon(context, loginType, classIsActive),
              if (loginType == 0)
                EditIconButton(
                  press: () => Navigator.push(context, route),
                ),
            ],
          ),
          SizedBox(height: kDefaultHeight * 2.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Android FrameWork',
                    style: TextStyle(
                      fontFamily: 'lexend',
                      fontSize: fontSize20,
                      fontWeight: FontWeight.w400,
                      color: kThirdColor,
                    ),
                  ),
                  Text(
                    'Mobile App 1 , lecture 1',
                    style: TextStyle(
                      fontFamily: 'lexend',
                      fontSize: fontSize16,
                      fontWeight: FontWeight.w300,
                      color: kThirdColor,
                    ),
                  ),
                  if (loginType == 0)
                    Text(
                      '2/2/2023',
                      style: TextStyle(
                        fontFamily: 'lexend',
                        fontSize: fontSize16,
                        fontWeight: FontWeight.w300,
                        color: kThirdColor,
                      ),
                    ),
                  if (classIsActive == 0)
                    Row(
                      children: [
                        Icon(
                          Icons.watch_later_outlined,
                          color: Colors.white,
                          size: kDefaultWidth * 2.2,
                        ),
                        SizedBox(width: kDefaultWidth * 0.5),
                        Text(
                          '02:00',
                          style: TextStyle(
                            fontFamily: 'lexend',
                            fontSize: fontSize14,
                            fontWeight: FontWeight.w300,
                            color: kThirdColor,
                          ),
                        ),
                      ],
                    )
                ],
              ),
              if (loginType == 0)
                Column(
                  children: [
                    classIsActive == 1
                        ? ToggleButton(toggleValue: true)
                        : QRCode(pin: 123, qrCodeSrc: ""),
                    SizedBox(height: kDefaultHeight * 2),
                    Container(
                      height: kDefaultHeight * 2.6,
                      width: kDefaultWidth * 4.7,
                      decoration: BoxDecoration(
                          color: const Color(0xffBFBFBF).withOpacity(0.63),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.white)),
                      child: Row(
                        children: const [
                          Icon(Icons.person_outline_outlined,
                              color: Colors.white),
                          Text('24', style: TextStyle(color: Colors.white))
                        ],
                      ),
                    )
                  ],
                )
            ],
          ),
        ],
      ),
    );
  }

  Widget cancelIcon(BuildContext context, int loginType, int ClassActivity) {
    return InkWell(
      onTap: () {
        loginType == 1 && ClassActivity == 1
            ? showLeaveDialog()
            : loginType == 0 && ClassActivity == 1
                ? showCloseDialog()
                : Navigator.pop(context);
      },
      child: SizedBox(
        height: screenHeight * .035,
        width: screenHeight * .035,
        child: loginType == 0 && ClassActivity == 1
            ? Image.asset('assets/icons/cancel.png')
            : const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
      ),
    );
  }

  showLeaveDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Are you sure to Leave this class?'),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text(
                'Leave',
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('CANCEL'),
            )
          ],
        );
      },
    );
  }

  showCloseDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Are you sure to close this class?'),
          actions: [
            TextButton(
              onPressed: () {
                var route =
                    MaterialPageRoute(builder: (context) => Attendance());
                Navigator.pushReplacement(context, route);
              },
              child: const Text(
                'CLOSE',
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('CANCEL'),
            )
          ],
        );
      },
    );
  }
}
