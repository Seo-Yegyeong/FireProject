import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproject/src/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class card_verStudent extends StatelessWidget {
  card_verStudent(this.statedoc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot<Map<String, dynamic>> statedoc;
  var _icon;
  var _text;

  @override
  Widget build(BuildContext context) {
    Timestamp t = statedoc['time'];
    String date = DateTime.fromMicrosecondsSinceEpoch(t.microsecondsSinceEpoch)
        .toString()
        .split(" ")[0];
    String time = DateTime.fromMicrosecondsSinceEpoch(t.microsecondsSinceEpoch)
        .toString()
        .split(" ")[1]
        .split(".")[0];

    if (statedoc['selection'] == 0) {
      _icon = "assets/Icons/Good.svg";
      _text = "좋아요";
    } else if (statedoc['selection'] == 1) {
      _icon = "assets/Icons/Good.svg";
      _text = "기뻐요";
    } else if (statedoc['selection'] == 2) {
      _icon = "assets/Icons/Good.svg";
      _text = "쉬고 싶어요";
    } else if (statedoc['selection'] == 3) {
      _icon = "assets/Icons/Good.svg";
      _text = "화나요";
    } else if (statedoc['selection'] == 4) {
      _icon = "assets/Icons/Good.svg";
      _text = "말하고 싶어요";
    } else {
      _icon = "assets/Icons/Good.svg";
      _text = "궁금해요";
    }

    return Column(
      children: [
        SizedBox(
          height: 10,
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 3),
          child: Container(
            height: getScreenHeight(context)*0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
                    color: Colors.white,

                boxShadow: [
                  BoxShadow(blurRadius: 5,
                      color: Colors.grey)
                ]
            ),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 10,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                            _icon,
                            width: 100,
                            height: 100,
                          ),
                            Padding(
                              padding: const EdgeInsets.only(left:10),
                              child: Text(_text,
                              style: TextStyle(
                                fontFamily: "DoHyeon",
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF5D5D5D),
                              ),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: getScreenWidth(context)*0.2,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(date),
                    Text(time),
                  ],
                ),
              ],
            ),
          ),
        ),


      ],
    );
  }
}
