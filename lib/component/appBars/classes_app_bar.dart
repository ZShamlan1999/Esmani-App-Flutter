import 'package:flutter/material.dart';
import 'package:esmani_app/component/appBars/component/class_details_card.dart';
import 'package:esmani_app/component/appBars/component/lecturer_details_and_qrcode.dart';
import 'package:esmani_app/utils/constant.dart';
import 'package:esmani_app/utils/models/classes.dart';
import 'package:provider/provider.dart';

class ClassesAppBar extends StatelessWidget {
  const ClassesAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int classIsActive = context
            .watch<Classes>()
            .lecturerClasses[context.watch<Classes>().selectedClassIndex!]
        ['IsActive'];
    return Container(
      color: kPrimaryColor,
      child: SafeArea(
        child: Column(
          children: [
            const ClassDetailsCard(),
            if (classIsActive == 1)
              Divider(thickness: 2, color: kThirdColor.withOpacity(0.18)),
            if (classIsActive == 1) const LecturerDetailsAndQRcode(),
            SizedBox(height: kDefaultHeight * 0.5)
          ],
        ),
      ),
    );
  }
}
