import 'package:flutter/material.dart';
import 'package:esmani_app/Screens/Cources/component/join_to_cource_dialog.dart';
import 'package:esmani_app/Screens/Cources/component/view_cources/cources_screen.dart';
import 'package:esmani_app/Screens/Cources/create_cource.dart';
import 'package:esmani_app/component/Other_Component/join_to_cource_floating_button.dart';
import 'package:esmani_app/component/appBars/app_bar.dart';
import 'package:esmani_app/utils/provider.dart';
import 'package:provider/provider.dart';

import '../../component/Other_Component/floating_add_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {  @override
  Widget build(BuildContext context) {
    var loginType = context.read<MyProvider>().loginType;
    return Scaffold(
      floatingActionButton: loginType == 0
          ? FlotingAddButton(screen: CreateCource())
          : loginType == 1
              ? JoinToCourceFloatingButton(onTap: showQRCodeDialog)
              : null,
      body: Column(
        children: [
          const EsmaniAppBar(),
          Expanded(child: const CoursesScreen())
        ],
      ),
    );
  }

  showQRCodeDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return const JoinToCourceDialog();
      },
    );
  }
}
