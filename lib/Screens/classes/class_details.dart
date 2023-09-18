// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:esmani_app/component/NavigationBars/navigation_bar2.dart';
import 'package:esmani_app/component/appBars/classes_app_bar.dart';
import 'package:esmani_app/utils/constant.dart';
import 'package:esmani_app/utils/models/classes.dart';
import 'package:esmani_app/utils/provider.dart';
import 'package:provider/provider.dart';

class ClassDetails extends StatefulWidget {
  const ClassDetails({super.key});

  @override
  State<ClassDetails> createState() => _ClassDetailsState();
}

class _ClassDetailsState extends State<ClassDetails> {
  @override
  Widget build(BuildContext context) {
    int classIsActive = context
            .watch<Classes>()
            .lecturerClasses[context.watch<Classes>().selectedClassIndex!]
        ['IsActive'];
    return Scaffold(
      backgroundColor: kSecondaryColor,
      bottomNavigationBar: NavigationBar2(voiceON: true),
      body: Column(
        children: [
          const ClassesAppBar(),
          if (classIsActive == 0) requestsTitle(),
          requestsGridView(context),
        ],
      ),
    );
  }

  Widget requestsGridView(BuildContext context) {
    return GridView.builder(
      itemCount: Provider.of<MyProvider>(context).listStudents.length,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, mainAxisSpacing: 15),
      itemBuilder: (context, index) {
        return Student(index: index);
      },
    );
  }

  Widget requestsTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultWidth * 2,
        vertical: kDefaultHeight,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Requests',
            style: TextStyle(
              fontFamily: 'inter',
              fontSize: fontSize16,
              fontWeight: FontWeight.w500,
              color: const Color(0xff898989),
            ),
          ),
          Text(
            '00:00',
            style: TextStyle(
              fontFamily: 'inter',
              fontSize: fontSize16,
              fontWeight: FontWeight.w500,
              color: const Color(0xff898989),
            ),
          )
        ],
      ),
    );
  }
}

class Student extends StatefulWidget {
  const Student({super.key, required this.index});

  final int index;

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
  @override
  Widget build(BuildContext context) {
    var classIsActive = Provider.of<MyProvider>(context).classIsActive;
    List<Map> listStudents =
        Provider.of<MyProvider>(context).listStudents.toList();
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              Provider.of<MyProvider>(context, listen: false).itemIsSelectd =
                  !Provider.of<MyProvider>(context, listen: false)
                      .itemIsSelectd;
            });
          },
          child: Container(
            height: screenHeight * 0.09,
            width: screenHeight * 0.09,
            margin: EdgeInsets.only(bottom: screenHeight * .0063),
            child: Stack(
              children: [
                Center(
                  child: Container(
                    height: screenHeight * 0.091,
                    width: screenHeight * 0.091,
                    padding: EdgeInsets.all(screenWidth * .0076),
                    decoration: BoxDecoration(
                      color: Provider.of<MyProvider>(context, listen: false)
                              .itemIsSelectd
                          ? Colors.green.shade300
                          : kThirdColor,
                      borderRadius: BorderRadius.circular(screenHeight * .132),
                    ),
                    child: listStudents[widget.index]['image'] != ''
                        ? CircleAvatar(
                            backgroundColor: const Color(0xffD9D9D9),
                            foregroundImage:
                                AssetImage(listStudents[widget.index]['image']))
                        : const Icon(
                            Icons.camera_alt_rounded,
                            color: Colors.grey,
                            size: 30,
                          ),
                  ),
                ),
                if (classIsActive)
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: kDefaultHeight * 2.2,
                      width: kDefaultHeight * 2.2,
                      decoration: BoxDecoration(
                          color: const Color(0xffeeeeee),
                          borderRadius:
                              BorderRadius.circular(screenWidth * .051),
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
        ),
        Text(
          '${listStudents[widget.index]['name']}',
          style: TextStyle(
            fontSize: fontSize12,
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    );
  }
}
