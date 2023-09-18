import 'package:flutter/material.dart';
import 'package:esmani_app/main.dart';
import 'package:esmani_app/utils/constant.dart';

class EsmaniAppBar extends StatelessWidget {
  const EsmaniAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.045),
      height: screenHeight * 0.192,
      color: kPrimaryColor,
      child: Row(
        children: [
          Container(
            height: screenHeight * 0.12,
            width: screenWidth * .23,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/images/hussin.png"),
            ),
          ),
          SizedBox(width: screenWidth * 0.08),
          Expanded(
            child: Text(
              "${loginPreferences.getString("fullname")}",
              style: TextStyle(
                fontFamily: 'Lexend',
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}

// PreferredSize appBar1(BuildContext context) {
//   return PreferredSize(
//     preferredSize: Size(double.infinity, screenHeight * 0.192),
//     child: Container(
//       padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.045),
//       height: screenHeight * 0.192,
//       color: kPrimaryColor,
//       child: Row(
//         children: [
//           Container(
//             height: screenHeight * 0.12,
//             width: screenWidth * .23,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(50),
//             ),
//             child: const CircleAvatar(
//               backgroundColor: Colors.white,
//               backgroundImage: AssetImage("assets/images/hussin.png"),
//             ),
//           ),
//           SizedBox(width: screenWidth * 0.08),
//           const Text(
//             "Hussein ALhamed",
//             style: TextStyle(
//               fontFamily: 'Lexend',
//               color: Colors.white,
//               fontSize: 20,
//               fontWeight: FontWeight.w500,
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }

PreferredSize appBar2(BuildContext context) {
  return PreferredSize(
    preferredSize: Size.fromHeight(screenHeight * 0.192),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.045),
      // height: screenHeight * 0.192,
      color: kPrimaryColor,
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: kPrimaryFontSize * .10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: screenHeight * 0.12,
                      width: screenHeight * 0.12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: kSecondaryColor,
                      ),
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        foregroundImage: AssetImage("assets/images/hussin.png"),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.08),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Mobile app 1",
                              style: TextStyle(
                                fontFamily: 'lexend',
                                fontSize: kPrimaryFontSize * .20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "2/2/2023",
                              style: TextStyle(
                                fontFamily: 'lexend',
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 16,
                                  width: 16,
                                  child: Image.asset(
                                    "assets/images/user (1).png",
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 9),
                                const Text(
                                  "24",
                                  style: TextStyle(
                                    fontFamily: 'lexend',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffBFBFBF).withOpacity(0.63),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    height: 26,
                    child: Switch(
                      value: true,
                      onChanged: (value) {},
                      thumbColor: const MaterialStatePropertyAll(Colors.white),
                      activeThumbImage:
                          const AssetImage("assets/images/open_lock.png"),
                      inactiveThumbImage:
                          const AssetImage("assets/images/open_lock.png"),
                      trackColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 34,
                    width: 34,
                    child: Image.asset("assets/images/QRcode.png"),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
