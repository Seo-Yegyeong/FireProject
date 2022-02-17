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
            icon: SvgPicture.asset("assets/icons/BackButton.svg"),
            onPressed: () {},
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 30.0,
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
                          Text(
                            '이름: 김시선',
                            style: TextStyle(
                              fontFamily: "DoHyeon",
                              fontSize: 25.0,
                              color: Color(0xFF000000),
                            ),
                          ),
                          Text(
                            '생년월일:2007/10/04',
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
                    padding: EdgeInsets.all(16),
                    height: 280,
                    width: 350,
                    decoration: BoxDecoration(color: Color(0xFFF2F2F2)),
                    child: Column(
                      children: <Widget>[
                        Text(
                          '현재 김시선의 상태는?',
                          style: TextStyle(
                            fontFamily: "DoHyeon",
                            fontSize: 30.0,
                            color: Color(0xFF000000),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon:
                                SvgPicture.asset("assets/icons/SadButton.svg"),
                                iconSize: 60.0,
                                onPressed: () {},
                              ),
                              IconButton(
                                icon:
                                SvgPicture.asset("assets/icons/SosoButton.svg"),
                                iconSize: 60.0,
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: SvgPicture.asset(
                                    "assets/icons/SmileButton.svg"),
                                iconSize: 60.0,
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: SvgPicture.asset(
                                    "assets/icons/AngryButton.svg"),
                                iconSize: 60.0,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Content(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    height: 200,
                    width: 350,
                    decoration: BoxDecoration(color: Color(0xFFF2F2F2)),
                    child: Column(
                      children: <Widget>[
                        Text(
                          '칭찬해주세요:)',
                          style: TextStyle(
                            fontFamily: "DoHyeon",
                            fontSize: 30.0,
                            color: Color(0xFF000000),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        SecondContent(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 40,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            print('Elevated button');
                          },
                          child: Text('저장', style: TextStyle(
                            fontFamily: "DoHyeon",
                            fontSize: 30.0,
                            color: Color(0xFF000000),
                          ),
                          ),
                          style: ElevatedButton.styleFrom(
                              elevation: 0.0,
                              primary: Color(0xFFDDDDDF),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)
                              )
                          ),
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

  Widget Content() {
    return Expanded(
      child: TextFormField(
        maxLines: 2,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          fillColor: Colors.grey,
          labelText: "왜 그런 기분인지 간략하게 설명해주세요.(100자 내외)",
          labelStyle: TextStyle(
              fontSize: 12
          ),
          border: OutlineInputBorder(
            //borderSide: BorderSide(width: 1,color: Colors.redAccent),
          ),
        ),
      ),
    );
  }
}

Widget SecondContent() {
  return TextFormField(
    maxLines: 2,
    textAlign: TextAlign.center,
    decoration: const InputDecoration(
      fillColor: Colors.grey,
      labelText: "오늘 자녀에게 칭찬해주고 싶은 점이 있나요?(200자 내외)",
      labelStyle: TextStyle(
          fontSize: 12
      ),
      border: OutlineInputBorder(
        //borderSide: BorderSide(width: 1,color: Colors.redAccent),
      ),
    ),
  );
}
