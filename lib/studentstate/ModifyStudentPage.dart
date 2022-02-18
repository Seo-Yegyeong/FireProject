
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
  double num=100;

  double num2=100;

  double num4=100;

  double num6=100;

  double num8=100;

  double num10=100;

  var _selection;
  final user = FirebaseAuth.instance.currentUser;

  static const TextStyle myFontStyle =
    TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Color(0xFF5D5D5D),);



  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    '상태를 선택해주세요!',
                    style: TextStyle(
                      fontFamily: "DoHyeonFont",
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
                                      Expanded(
                                        child: Container(
                                          child: IconButton(
                                            icon: SvgPicture.asset(
                                                "assets/Icons/Good.svg"),
                                            iconSize: num,
                                            onPressed: () {
                                              if (isHovering == true) {
                                                setState(() {
                                                  isHovering = false;
                                                  num=190;
                                                });
                                              }
                                              else {
                                                setState(() {
                                                  isHovering = true;
                                                  num=130;
                                                });
                                              }
                                              setState(() {
                                                _selection= 1;
                                              });
                                              print('좋아요');
                                            },
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
                                          style: myFontStyle,
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
                                            setState(() {
                                              isHovering = false;
                                              num2=190;
                                            });
                                          }
                                          else {
                                            setState(() {
                                              isHovering = true;
                                              num2=130;
                                            });
                                          }
                                          setState(() {
                                            _selection=2;
                                          });
                                          print('기뻐요');
                                        },
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
                                      style: myFontStyle,
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
                                                setState(() {
                                                  isHovering = false;
                                                  num4=190;
                                                });
                                              }
                                              else {
                                                setState(() {
                                                  isHovering = true;
                                                  num4=130;
                                                });
                                              }
                                              setState(() {
                                                _selection=3;
                                              });
                                              print('쉬고 싶어요');
                                            },
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
                                          style: myFontStyle,
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
                                            setState(() {
                                              isHovering = false;
                                              num6=190;
                                            });
                                          }
                                          else {
                                            setState(() {
                                              isHovering = true;
                                              num6=130;
                                            });
                                          }
                                          setState(() {
                                            _selection=4;
                                          });
                                          print('화나요');
                                        },
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
                                      style: myFontStyle,
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
                                                setState(() {
                                                  isHovering = false;
                                                  num8=190;
                                                });
                                              }
                                              else {
                                                setState(() {
                                                  isHovering = true;
                                                  num8=130;
                                                });
                                              }
                                              setState(() {
                                                _selection=5;
                                              });
                                              print('제 이야기를 들어주세요');
                                            },
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
                                          style: myFontStyle,
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
                                            setState(() {
                                              isHovering = false;
                                              num10=190;
                                            });
                                          }
                                          else {
                                            setState(() {
                                              isHovering = true;
                                              num10=130;
                                            });
                                          }
                                          setState(() {
                                            _selection=6;
                                          });
                                          print('기뻐요');
                                        },
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
                                      style: myFontStyle,
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
                        fontFamily: "DoHyeonFont",
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
