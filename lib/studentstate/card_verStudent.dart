import 'package:cloud_firestore/cloud_firestore.dart';
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

    if (statedoc['selection'] == 1) {
      _icon = "assets/Icons/Good.svg";
      _text = "좋아요";
    } else if (statedoc['selection'] == 2) {
      _icon = "assets/Icons/Good.svg";
      _text = "기뻐요";
    } else if (statedoc['selection'] == 3) {
      _icon = "assets/Icons/Good.svg";
      _text = "쉬고 싶어요";
    } else if (statedoc['selection'] == 4) {
      _icon = "assets/Icons/Good.svg";
      _text = "화나요";
    } else if (statedoc['selection'] == 5) {
      _icon = "assets/Icons/Good.svg";
      _text = "제 이야기를 들어주세요";
    } else {
      _icon = "assets/Icons/Good.svg";
      _text = "기뻐요";
    }
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 3),
          child: Container(
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
                Column(
                  children: [
                    Text(date),
                    Text(time),
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          _icon,
                          width: 50,
                          height: 50,
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
                  ),
                ),
              ],
            ),
          ),
        ),


      ],
    );
  }
}
