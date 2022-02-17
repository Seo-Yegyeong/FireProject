import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproject/board/PopupMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class FreeBoardCard extends StatefulWidget {
  //const FreeBoardCard(  {Key? key}) : super(key: key);
  FreeBoardCard(this.freeDoc, this.isMe,   {Key? key}) : super(key: key);
  QueryDocumentSnapshot<Map<String, dynamic>> freeDoc;
  bool isMe;



  @override
  _FreeBoardCardState createState() => _FreeBoardCardState();
}

class _FreeBoardCardState extends State<FreeBoardCard> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      Text(
                          widget.freeDoc['title'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          )
                      ),
                    widget.isMe? PopupMenu()
                        :Text(" ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ))
                  ],

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 1),
                child: Text(widget.freeDoc['content'],
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    children: [
                      Text(
                          DateTime.fromMicrosecondsSinceEpoch(widget.freeDoc['time'].microsecondsSinceEpoch).toString().split(" ")[0],
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                          )
                      ),
                      Text(" | ",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                          )),
                      Text(widget.freeDoc['wname'],
                          style: TextStyle(
                            fontWeight: FontWeight.w100,
                          )),


                    ]
                ),
                Row(
                    children: [
                      SvgPicture.asset('assets/icons/heart.svg'),
                      Text(widget.freeDoc['cnum'].toString()),
                      Text('   '),//중간 띄워주기용
                      SvgPicture.asset('assets/icons/comment.svg'),
                      Text(widget.freeDoc['like'].toString()),

                    ]
                ),

              ],
            ),
          Container(
              width: 500,
              child: Divider( thickness: 1.0)),

        ],
      ),
    );
  }
}
