
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fireproject/studentstate/IdentifyStudentPage.dart';
import 'package:fireproject/studentstate/screen_verStudent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';




class ModifyStudentPage extends StatefulWidget {
  const ModifyStudentPage({Key? key}) : super(key: key);

  @override
  _ModifyStudentPageState createState() => _ModifyStudentPageState();
}

class _ModifyStudentPageState extends State<ModifyStudentPage> {
  bool click = true;
  bool isHovering = false;
  double num=0;
  double num1=0;
  double num2=0;
  double num3=0;
  double num4=0;
  double num5=0;
  double num6=0;
  double num7=0;
  double num8=0;
  double num9=0;
  double num10=0;
  double num11=0;
  var _selection;
  final user = FirebaseAuth.instance.currentUser;


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
            onPressed: () {},
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    '상태를 선택해주세요!',
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
                    padding: EdgeInsets.all(20),
                    width: 350,
                    height: 700,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amber),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 150,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Column(
                                    children: [
                                      // HoverButton(onpressed: (){},
                                      //  child: Image.asset("assets/Icons/Good.png"),
                                      //
                                      //
                                      // ),

                                      Expanded(
                                        child: Container(
                                          child: IconButton(
                                            icon: SvgPicture.asset(
                                                "assets/Icons/Good.svg"),
                                            iconSize: num,
                                            onPressed: () {
                                              if (isHovering == true) {
                                                isHovering = false;
                                                num=100;

                                              }
                                              else {
                                                isHovering = true;
                                                num=130;

                                              }
                                              setState(() {
                                                _selection= 1;
                                              });
                                              print('좋아요');
                                            },
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(width: num1),
                                          ),
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 1.0,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey, width: 1.0),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          '좋아요',
                                          style: TextStyle(
                                            fontFamily: "DoHyeon",
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF5D5D5D),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 150,
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: IconButton(
                                        icon: SvgPicture.asset(
                                            "assets/Icons/Good.svg"),
                                        iconSize: num2,
                                        onPressed: () {
                                          if (isHovering == true) {
                                            isHovering = false;
                                            num2=100;
                                            num3 = 1.0;
                                          }
                                          else {
                                            isHovering = true;
                                            num2=130;
                                            num3 = 2.0;
                                          }
                                          setState(() {
                                            _selection=2;
                                          });
                                          print('쉬고 싶어요');
                                        },
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(width: num1),
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 1.0,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey, width: 1.0),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '쉬고 싶어요',
                                      style: TextStyle(
                                        fontFamily: "DoHyeon",
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF5D5D5D),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 150,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: IconButton(
                                            icon: SvgPicture.asset(
                                                "assets/Icons/Good.svg"),
                                            iconSize: num4,
                                            onPressed: () {
                                              if (isHovering == true) {
                                                isHovering = false;
                                                num4=100;
                                                num5 = 1.0;
                                              }
                                              else {
                                                isHovering = true;
                                                num4=130;
                                                num5 = 2.0;
                                              }
                                              setState(() {
                                                _selection=3;
                                              });
                                              print('기뻐요');
                                            },
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(width: num1),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 1.0,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey, width: 1.0),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          '기뻐요',
                                          style: TextStyle(
                                            fontFamily: "DoHyeon",
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF5D5D5D),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 150,
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: IconButton(
                                        icon: SvgPicture.asset(
                                            "assets/Icons/Good.svg"),
                                        iconSize: num6,
                                        onPressed: () {
                                          if (isHovering == true) {
                                            isHovering = false;
                                            num6=100;
                                            num7 = 1.0;
                                          }
                                          else {
                                            isHovering = true;
                                            num6=130;
                                            num7 = 2.0;
                                          }
                                          setState(() {
                                            _selection=4;
                                          });
                                          print('화나요');
                                        },
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(width: num1),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 1.0,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey, width: 1.0),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '화나요',
                                      style: TextStyle(
                                        fontFamily: "DoHyeon",
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF5D5D5D),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 150,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: IconButton(
                                            icon: SvgPicture.asset(
                                                "assets/Icons/Good.svg"),
                                            iconSize: num8,
                                            onPressed: () {
                                              if (isHovering == true) {
                                                isHovering = false;
                                                num8=100;
                                                num9 = 1.0;
                                              }
                                              else {
                                                isHovering = true;
                                                num8=130;
                                                num9 = 2.0;
                                              }
                                              setState(() {
                                                _selection=5;
                                              });
                                              print('제 이야기를 들어주세요');
                                            },
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(width: num1),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 1.0,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey, width: 1.0),
                                        ),
                                      ),
                                      Container(
                                        child: Text(
                                          '제 이야기를 들어주세요',
                                          style: TextStyle(
                                            fontFamily: "DoHyeon",
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF5D5D5D),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 150,
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: IconButton(
                                        icon: SvgPicture.asset(
                                            "assets/Icons/Good.svg"),
                                        iconSize: num10,
                                        onPressed: () {
                                          if (isHovering == true) {
                                            isHovering = false;
                                            num10=100;
                                            num11 = 1.0;
                                          }
                                          else {
                                            isHovering = true;
                                            num10=130;
                                            num11 = 2.0;
                                          }
                                          setState(() {
                                            _selection=6;
                                          });
                                          print('슬퍼요');
                                        },
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(width: num1),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 1.0,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey, width: 1.0),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '슬퍼요',
                                      style: TextStyle(
                                        fontFamily: "DoHyeon",
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF5D5D5D),
                                      ),
                                    ),
                                  )
                                ],
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
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      FirebaseFirestore.instance.collection('state').add({
                        'selection': _selection,
                        'name': user!.displayName,
                        'uid' : user!.uid,
                        'time': Timestamp.now(),

                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => screen_verStudent()));
                    },
                    child: Text(
                      '저장',
                      style: TextStyle(
                        fontFamily: "DoHyeon",
                        fontSize: 30.0,
                        color: Color(0xFF000000),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFFFC700),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
