import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ModifyStudentPage extends StatelessWidget {
  const ModifyStudentPage({Key? key}) : super(key: key);

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
            icon: SvgPicture.asset("assets/Icons/BackButton.svg"),
            onPressed: () {

            },
          ),
        ),
        body:

        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            const SizedBox(
              height: 50.0,
              width: 100.0,
            ),
            Row(
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: new BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2.0),
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Column(
                  children: [
                    Text('이름: 김시선',
                      style: TextStyle(
                        fontFamily: "DoHyeon",
                        fontSize: 25.0,
                        color: Color(0xFF000000),
                      ),
                    ),
                    Text('생년월일:2007/10/04',
                      style: TextStyle(
                        fontFamily: "DoHyeon",
                        fontSize: 25.0,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              height: 300,
              width: 350,
              decoration: BoxDecoration(
                  color: Color(0xFFF2F2F2)
              ),
              child: Column(
                children: [
                  Text('현재 김시선의 상태는?',
                    style: TextStyle(
                      fontFamily: "DoHyeon",
                      fontSize: 30.0,
                      color: Color(0xFF000000),
                    ),
                  ),

                  Row(
                    children:[
                      IconButton(
                        icon: SvgPicture.asset("assets/Icons/SadButton,svg"),
                        iconSize: 50.0,
                        onPressed: () {},
                      ),
                      Text('현재 김시선의 상태는?',
                        style: TextStyle(
                          fontFamily: "DoHyeon",
                          fontSize: 30.0,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ],
                  ),


                ],


              ),
            ),
          ],
        ),

      ),
    );
  }
}
