
import 'package:fireproject/studentstate/list_verStudent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../src/size.dart';

class screen_verStudent extends StatelessWidget {
  const screen_verStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: getAppBarHeight(context),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: SvgPicture.asset("assets/Icons/BackButton.svg"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          SizedBox(width: 35,),
        ],
        title: Center(child: Text("나의 상태기록", style: TextStyle(color: Colors.black, fontFamily: "DohyeonFont", fontSize: 25),)),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xffFCDF46),
        ),
        child: Column(
          children: [
            Expanded(
                child: list_verStudent()),
          ],
        ),
      ),
    );
  }
}
