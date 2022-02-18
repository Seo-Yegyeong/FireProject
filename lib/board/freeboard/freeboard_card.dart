import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum choice {delete, edit}

class FreeBoardCard extends StatefulWidget {
  //const FreeBoardCard(  {Key? key}) : super(key: key);
  FreeBoardCard(this.freeDoc, this.isMe, this.docId,   {Key? key}) : super(key: key);
  QueryDocumentSnapshot<Map<String, dynamic>> freeDoc;
  bool isMe;
  String docId;



  @override
  _FreeBoardCardState createState() => _FreeBoardCardState();
}

class _FreeBoardCardState extends State<FreeBoardCard> {
  void _delete(){
    final user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection('board/2fw6mf2i4PHLVwjp0M3m/freeboard').doc(widget.docId).delete();

  }
  void _edit(){
    final user = FirebaseAuth.instance.currentUser;
    //FirebaseFirestore.instance.collection('board/2fw6mf2i4PHLVwjp0M3m/freeboard').doc(widget.docId).delete();

  }

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
                    widget.isMe? PopupMenuButton<choice>(
                      onSelected: (choice result) { setState(() {
                        if(result == choice.delete){
                          _delete();
                        }
                        else if(result == choice.edit){
                          _edit();
                        }
                      }); },
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<choice>>[
                        const PopupMenuItem<choice>(
                          value: choice.delete,
                          child: Text('삭제'),
                        ),
                        const PopupMenuItem<choice>(
                          value: choice.edit,
                          child: Text('수정'),
                        ),
                      ],
                    )
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
