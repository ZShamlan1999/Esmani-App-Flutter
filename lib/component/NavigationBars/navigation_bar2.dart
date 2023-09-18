// ignore_for_file: dead_code, must_be_immutable

import 'package:flutter/material.dart';
import 'package:esmani_app/utils/constant.dart';
import 'package:esmani_app/utils/provider.dart';
import 'package:provider/provider.dart';

class NavigationBar2 extends StatefulWidget {
  NavigationBar2({Key? key, required this.voiceON}) : super(key: key);
  bool voiceON;

  @override
  State<NavigationBar2> createState() => _NavigationBar2State();
}

class _NavigationBar2State extends State<NavigationBar2> {
  @override
  Widget build(BuildContext context) {
    var classIsActive =
        Provider.of<MyProvider>(context, listen: false).classIsActive;
    var loginTypeIsStudent =
        Provider.of<MyProvider>(context, listen: false).loginTypeIsStudent;
    return Container(
      height: kDefaultHeight * 10,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 7),
        ],
      ),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * .052),
          child: loginTypeIsStudent
              ? StudentMode(classIsActive)
              : LecturerMode(classIsActive)),
    );
  }

  Widget LecturerMode(bool classIsActive) {
    return classIsActive
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              micCard(),
              students(context),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [students(context)],
          );
  }

  Widget StudentMode(bool classIsActive) {
    return classIsActive
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              yourMicButton(),
              requestButton(),
              students(context),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              downLoadPDF(),
              downLoadVoice(),
            ],
          );
  }

  Widget downLoadPDF() {
    return MaterialButton(
      onPressed: () {},
      color: kPrimaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: Row(
        children: [
          SizedBox(
            height: kDefaultHeight * 1.6,
            width: kDefaultWidth * 1.5,
            child: FittedBox(
              child: Image.asset('assets/icons/download.png'),
            ),
          ),
          SizedBox(width: kDefaultWidth * 0.5),
          Text(
            'Lecture PDF',
            style: TextStyle(
              fontSize: fontSize14,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget downLoadVoice() {
    return MaterialButton(
      onPressed: () {},
      color: kPrimaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: Row(
        children: [
          SizedBox(
            height: kDefaultHeight * 1.6,
            width: kDefaultWidth * 1.5,
            child: FittedBox(
              child: Image.asset('assets/icons/download.png'),
            ),
          ),
          SizedBox(width: kDefaultWidth * 0.5),
          Text(
            'Session Voice',
            style: TextStyle(
              fontSize: fontSize14,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget students(BuildContext context) {
    List<Map> listStudents =
        Provider.of<MyProvider>(context).listStudents.toList();
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          builder: (context) {
            return Container(
              height: screenHeight * .92,
              decoration: const BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: screenWidth * 0.015,
                    width: screenWidth * .25,
                    margin: EdgeInsets.only(
                      top: screenHeight * 0.02,
                      bottom: screenHeight * 0.035,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  GridView.builder(
                    itemCount:
                        Provider.of<MyProvider>(context).listStudents.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: screenHeight * 0.02,
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            height: screenHeight * 0.09,
                            width: screenHeight * 0.09,
                            margin: const EdgeInsets.only(bottom: 5),
                            child: Stack(
                              children: [
                                Center(
                                  child: Container(
                                    height: screenHeight * 0.091,
                                    width: screenHeight * 0.091,
                                    padding:
                                        EdgeInsets.all(screenWidth * .0076),
                                    decoration: BoxDecoration(
                                      color: kThirdColor,
                                      borderRadius: BorderRadius.circular(
                                          screenHeight * .132),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: listStudents[index]['image'] != ''
                                          ? CircleAvatar(
                                              backgroundColor:
                                                  const Color(0xffD9D9D9),
                                              foregroundImage: AssetImage(
                                                  listStudents[index]['image']))
                                          : Icon(
                                              Icons.camera_alt_rounded,
                                              color: Colors.grey,
                                              size: screenWidth * 0.078,
                                            ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    height: screenHeight * 0.028,
                                    width: screenHeight * 0.028,
                                    decoration: BoxDecoration(
                                        color: const Color(0xffeeeeee),
                                        borderRadius: BorderRadius.circular(
                                            screenWidth * .051),
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.white,
                                        )),
                                    child: const FittedBox(
                                      child: Icon(Icons.keyboard_voice),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text('${listStudents[index]['name']}')
                        ],
                      );
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Stack(
                children: [
                  Container(
                    height: screenHeight * 0.058,
                    width: screenHeight * 0.058,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: const Color(0xffC8C8C8),
                        width: 2,
                      ),
                    ),
                    child: const Center(
                      child: CircleAvatar(
                        foregroundImage: AssetImage('assets/images/hussin.png'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: screenWidth * 0.052),
                    height: screenHeight * 0.058,
                    width: screenHeight * 0.058,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: const Color(0xffC8C8C8),
                        width: 2,
                      ),
                    ),
                    child: const Center(
                      child: CircleAvatar(
                        foregroundImage: AssetImage('assets/images/hussin.png'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: screenWidth * .104),
                    height: screenHeight * 0.058,
                    width: screenHeight * 0.058,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: const Color(0xffC8C8C8),
                        width: 2,
                      ),
                    ),
                    child: const Center(
                      child: CircleAvatar(
                        foregroundImage: AssetImage('assets/images/hussin.png'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: screenWidth * .156),
                    height: screenHeight * 0.058,
                    width: screenHeight * 0.058,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: const Color(0xffC8C8C8),
                        width: 2,
                      ),
                    ),
                    child: const Center(
                      child: CircleAvatar(
                        foregroundImage: AssetImage('assets/images/hussin.png'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: screenWidth * .208),
                    height: screenHeight * 0.058,
                    width: screenHeight * 0.058,
                    decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: const Color(0xffC8C8C8),
                        width: 2,
                      ),
                    ),
                    child: const Center(
                      child: Text('+24'),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.012),
          Text(
            'See all students',
            style: TextStyle(
              fontSize: fontSize12,
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
          )
        ],
      ),
    );
  }

  Widget micCard() {
    return SizedBox(
      width: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                widget.voiceON = !widget.voiceON;
              });
            },
            child: Container(
              height: screenHeight * 0.058,
              width: screenHeight * 0.058,
              decoration: BoxDecoration(
                color: widget.voiceON ? Colors.green.shade400 : Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: const Color(0xffB4B4B4)),
              ),
              child: Center(
                child: Icon(
                  Icons.keyboard_voice,
                  color: widget.voiceON ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.012),
          Text(
            widget.voiceON ? 'Mic is on' : 'Mic is off',
            style: TextStyle(
              fontSize: fontSize12,
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Widget requestButton() {
    bool requestIsSend = false;
    bool requestIsAccept = false;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultWidth * 0.5,
            vertical: kDefaultHeight * 0.5,
          ),
          height: kDefaultHeight * 4.5,
          width: kDefaultWidth * 4.5,
          decoration: BoxDecoration(
            color: !requestIsAccept ? Colors.white : Colors.green.shade400,
            border: !requestIsAccept ? Border.all(color: Colors.grey) : null,
            borderRadius: BorderRadius.circular(50),
          ),
          child: SizedBox(
            height: kDefaultHeight * 2.8,
            width: kDefaultWidth * 2.8,
            child: Center(
              child: requestIsSend && !requestIsAccept
                  ? Container(
                      height: kDefaultHeight * 2.2,
                      width: kDefaultWidth * 2.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.green.shade400,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.done,
                          size: kDefaultWidth * 1.5,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : Image.asset(
                      !requestIsAccept
                          ? 'assets/icons/mic.png'
                          : 'assets/icons/mic 2.png',
                    ),
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.012),
        Text(
          requestIsSend && !requestIsAccept
              ? 'Request Send'
              : requestIsAccept
                  ? 'Mic is on'
                  : 'Reguest',
          style: TextStyle(
            fontSize: fontSize12,
            color: Colors.black,
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    );
  }

  Widget yourMicButton() {
    List<Map> listStudents =
        Provider.of<MyProvider>(context).listStudents.toList();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: kDefaultHeight * 6,
          width: kDefaultWidth * 6,
          margin: EdgeInsets.only(bottom: screenHeight * .0063),
          child: Stack(
            children: [
              Center(
                child: Container(
                  height: kDefaultHeight * 6,
                  width: kDefaultWidth * 6,
                  padding: EdgeInsets.all(screenWidth * .0076),
                  decoration: BoxDecoration(
                    color: kThirdColor,
                    borderRadius: BorderRadius.circular(screenHeight * .132),
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: listStudents[0]['image'] != ''
                        ? CircleAvatar(
                            backgroundColor: const Color(0xffD9D9D9),
                            foregroundImage:
                                AssetImage(listStudents[0]['image']))
                        : const Icon(
                            Icons.camera_alt_rounded,
                            color: Colors.grey,
                            size: 30,
                          ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: kDefaultHeight * 2.2,
                  width: kDefaultHeight * 2.2,
                  decoration: BoxDecoration(
                      color: const Color(0xffeeeeee),
                      borderRadius: BorderRadius.circular(screenWidth * .051),
                      border: Border.all(
                        width: 1,
                        color: Colors.white,
                      )),
                  child: const FittedBox(
                    child: Icon(Icons.keyboard_voice),
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          'you',
          style: TextStyle(
            fontSize: fontSize12,
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    );
  }
}
