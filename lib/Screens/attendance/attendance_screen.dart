import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:esmani_app/Screens/Cources/cource_details/classes_screen.dart';
import 'package:esmani_app/utils/constant.dart';

class Attendance extends StatefulWidget {
  const Attendance({Key? key}) : super(key: key);

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  bool isAttend = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Attendance',
          style: TextStyle(
            fontSize: fontSize20,
            color: kPrimaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        actions: [
          IconButton(
              onPressed: () {
                var route =
                    MaterialPageRoute(builder: (context) => ClassesScreen());
                Navigator.pushReplacement(context, route);
              },
              icon: Icon(
                Icons.save,
                color: kPrimaryColor,
              ))
        ],
      ),
      bottomNavigationBar: bottomNavBar(),
      backgroundColor: kSecondaryColor,
      body: Column(
        children: [
          levelAndDate(),
          const Divider(thickness: 1.5),
          attendanceBuilder(context),
        ],
      ),
    );
  }

  Widget levelAndDate() {
    return Padding(
      padding: EdgeInsets.only(
        left: kDefaultWidth * 2.2,
        right: kDefaultWidth * 2.2,
        top: kDefaultHeight * 3,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Level 4',
            style: TextStyle(
              fontSize: fontSize16,
              fontWeight: FontWeight.w300,
              color: const Color(0xff1C1C1C),
            ),
          ),
          Text(
            '2/2/2023',
            style: TextStyle(
              fontSize: fontSize16,
              fontWeight: FontWeight.w300,
              color: const Color(0xff1C1C1C),
            ),
          ),
        ],
      ),
    );
  }

  Widget attendanceBuilder(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) {
        return Column(
          textDirection: TextDirection.rtl,
          children: [
            StudentAttendanceDetails(index: index),
            const Divider(),
          ],
        );
      },
    );
  }

  Widget bottomNavBar() {
    return Container(
      height: kDefaultHeight * 9.2,
      decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.5),
                spreadRadius: 0,
                blurRadius: 10,
                offset: const Offset(0, 5)),
          ]),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultWidth * 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => addNewAttendanceStudent(),
                );
              },
              padding: EdgeInsets.symmetric(
                  horizontal: kDefaultWidth, vertical: kDefaultHeight),
              color: kPrimaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: Row(
                children: [
                  SizedBox(
                    height: kDefaultHeight * 2,
                    width: kDefaultHeight * 2,
                    child: const FittedBox(
                        child: Icon(Icons.add, color: Colors.white)),
                  ),
                  // SizedBox(width: kDefaultWidth * .5),
                  Text(
                    "Add Student",
                    style: TextStyle(
                      fontSize: fontSize12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {},
              padding: EdgeInsets.symmetric(
                  horizontal: kDefaultWidth, vertical: kDefaultHeight),
              color: kPrimaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              child: Row(
                children: [
                  SizedBox(
                    height: kDefaultHeight * 1.7,
                    width: kDefaultHeight * 1.4,
                    child: Image.asset('assets/icons/download.png'),
                  ),
                  SizedBox(width: kDefaultWidth * .5),
                  Text(
                    "DownLoad",
                    style: TextStyle(
                      fontSize: fontSize12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget addNewAttendanceStudent() {
    return SizedBox(
      child: CupertinoAlertDialog(
        title: const Text('Add student'),
        content: Material(
          color: Colors.transparent,
          child: Column(
            children: [
              SizedBox(
                height: kDefaultHeight * 4.5,
                child: TextFormField(
                  cursorColor: const Color(0xff535353),
                  keyboardType: TextInputType.number,
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: InputDecoration(
                    hintText: "Student ID",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              SizedBox(height: kDefaultHeight * 0.5),
              MaterialButton(
                minWidth: kDefaultWidth * 15,
                height: kDefaultHeight * 4,
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: kPrimaryColor,
                child: Text(
                  "Add",
                  style: TextStyle(
                    color: kSecondaryColor,
                    fontFamily: 'Inter',
                    fontSize: fontSize18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StudentAttendanceDetails extends StatefulWidget {
  const StudentAttendanceDetails({Key? key, required this.index})
      : super(key: key);
  final int index;

  @override
  State<StudentAttendanceDetails> createState() =>
      _StudentAttendanceDetailsState();
}

class _StudentAttendanceDetailsState extends State<StudentAttendanceDetails> {
  bool isAttend = true;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        setState(() {
          isAttend = !isAttend;
        });
      },
      trailing: Container(
        height: kDefaultHeight * 3.5,
        width: kDefaultHeight * 3.5,
        decoration: BoxDecoration(
          color: kThirdColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: kPrimaryColor),
        ),
        child: Center(
            child: Text(
          '${widget.index + 1}',
          style: TextStyle(
            fontSize: fontSize20,
            fontWeight: FontWeight.w300,
            color: kPrimaryColor,
          ),
        )),
      ),
      title: const Text.rich(
        textDirection: TextDirection.rtl,
        TextSpan(
          children: [
            TextSpan(
              text: 'الأسم: ',
              style: TextStyle(color: kPrimaryColor),
            ),
            TextSpan(
              text: 'محمد ربيع حمد صالح بن شحبل',
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
      subtitle: const Text.rich(
        textDirection: TextDirection.rtl,
        TextSpan(
          children: [
            TextSpan(
              text: 'رقم القيد: ',
              style: TextStyle(color: kPrimaryColor),
            ),
            TextSpan(
              text: '1552656505',
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
      leading: Container(
        height: kDefaultHeight * 3,
        width: kDefaultHeight * 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isAttend ? const Color(0xff82FF55) : Colors.red,
        ),
        child: Center(
          child: FittedBox(
            child: isAttend
                ? const Icon(Icons.done_outlined, color: Colors.white)
                : const Text('X', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
