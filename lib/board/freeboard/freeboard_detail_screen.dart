import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproject/board/PopupMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen(this.freeDoc, this.isMe, {Key? key}) : super(key: key);
  QueryDocumentSnapshot<Map<String, dynamic>> freeDoc;
  bool isMe;

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
    body: Container(
      child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.amber,
                        ),
                        Column(
                          children: [
                            Text(widget.freeDoc['wname']),
                            Text(DateTime.fromMicrosecondsSinceEpoch(widget.freeDoc['time'].microsecondsSinceEpoch).toString().split(" ")[0]),
                          ],
                        ),
                      ],
                    ),
                    widget.isMe? PopupMenu():Text("")
                  ],
                ),
                Text(widget.freeDoc['title']),
                Text(widget.freeDoc['content']),
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

          ],
        ),
      ),
    ),
    );
  }
}
