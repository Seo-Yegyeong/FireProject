import 'package:fireproject/studentstate/ModifyStudentPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IdentifyStudentPage extends StatefulWidget {
  const IdentifyStudentPage({Key? key}) : super(key: key);

  @override
  _IdentifyStudentPageState createState() => _IdentifyStudentPageState();
}

class _IdentifyStudentPageState extends State<IdentifyStudentPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            icon: SvgPicture.asset("assets/icons/BackButton.svg"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ModifyStudentPage()));
            },
          ),
        ),
        body: ListView(
          children: [
            Padding(padding: EdgeInsets.all(20),
            child:
              Column(
                children: [
                  Text(
                    '지금 나의 기분',
                    style: TextStyle(
                      fontFamily: "DoHyeon",
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF000000),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 350,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0,1.0),
                          blurRadius: 6.0,
                        ),
                      ],
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
}
