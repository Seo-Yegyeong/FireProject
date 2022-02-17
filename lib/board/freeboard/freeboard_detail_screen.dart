import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproject/board/PopupMenu.dart';
import 'package:fireproject/board/freeboard/comment/new_comment.dart';
import 'package:fireproject/board/freeboard/freeboard_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'comment/comment_list.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen(this.freeDoc, this.isMe, this.docId, {Key? key}) : super(key: key);
  QueryDocumentSnapshot<Map<String, dynamic>> freeDoc;
  bool isMe;
  String docId;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('자유게시판'),

        titleTextStyle: const TextStyle(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.exit_to_app_sharp,
              color: Colors.amber,
            ),
            onPressed: (){

            },
          )
        ],
      ),
    body: Column(
        children: [
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.amber,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(widget.freeDoc['wname'],
                                          ),
                                          Text(DateTime.fromMicrosecondsSinceEpoch(widget.freeDoc['time'].microsecondsSinceEpoch).toString().split(" ")[0]),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                widget.isMe? PopupMenu():Text("")
                              ],
                            ),
                            Text(widget.freeDoc['title'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                )),
                            Text(widget.freeDoc['content'],
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                )),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                              child: Row(
                                  children: [
                                    SvgPicture.asset('assets/icons/heart.svg'),
                                    Text(widget.freeDoc['cnum'].toString()),
                                    Text('   '),//중간 띄워주기용
                                    SvgPicture.asset('assets/icons/comment.svg'),
                                    Text(widget.freeDoc['like'].toString()),

                                  ]
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 70,
                        color: Colors.amber,

                      ),


                        CommentList(widget.docId),






                    ],
                  ),
                ),
              ],
            ),
          ),
          NewComment(widget.docId),
        ]
    ),

    );
  }
}
