import 'package:flutter/material.dart';
import 'package:esmani_app/Screens/Cources/component/view_cources/search_bar.dart';
import 'package:esmani_app/Screens/classes/class_details.dart';
import 'package:esmani_app/utils/constant.dart';
import 'package:esmani_app/utils/provider.dart';
import 'package:provider/provider.dart';

class ClassBuilder extends StatelessWidget {
  const ClassBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map> listCources = Provider.of<MyProvider>(context).listClass.toList();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.039, top: screenHeight * 0.013),
          child: Row(
            children: [
              const Expanded(flex: 5, child: SearchCard(placeHolder: 'Search')),
              SizedBox(width: screenWidth * 0.039),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            // physics: const ScrollPhysics(),
            itemCount: Provider.of<MyProvider>(context).listClass.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      var route = MaterialPageRoute(
                          builder: (context) => ClassDetails());

                      Navigator.push(context, route);
                    },
                    title: Text(
                      listCources[index]['name'],
                      style: const TextStyle(
                          fontFamily: 'lexend',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.black),
                    ),
                    leading: Container(
                      height: screenHeight * 0.071,
                      width: screenHeight * 0.071,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(),
                      ),
                      child: SizedBox(
                        height: screenHeight * 0.071,
                        width: screenHeight * 0.071,
                        child: GestureDetector(
                          onTap: () {},
                          child: listCources[index]['image'] != ''
                              ? CircleAvatar(
                                  backgroundColor: Colors.white,
                                  foregroundImage: AssetImage(
                                    listCources[index]['image'],
                                  ),
                                )
                              : const Center(child: Text("Class")),
                        ),
                      ),
                    ),
                    trailing: const Icon(
                      Icons.more_horiz,
                      size: 35,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.035),
                    child: const Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
