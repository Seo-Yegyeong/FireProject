
import 'package:fireproject/studentstate/list_verStudent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class screen_verStudent extends StatelessWidget {
  const screen_verStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: SvgPicture.asset("assets/Icons/BackButton.svg"),
          onPressed: () {},
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFffd336),
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
