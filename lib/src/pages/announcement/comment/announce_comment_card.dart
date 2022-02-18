import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AnnounceCommentCard extends StatefulWidget {
  const AnnounceCommentCard({Key? key}) : super(key: key);

  @override
  _AnnounceCommentCardState createState() => _AnnounceCommentCardState();
}

class _AnnounceCommentCardState extends State<AnnounceCommentCard> {
  void _delete(){
    final user = FirebaseAuth.instance.currentUser;
    //FirebaseFirestore.instance.collection('board/2fw6mf2i4PHLVwjp0M3m/comment').doc(widget.docId).delete();

    /*Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => FreeBoardScreen(),

      ),
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 2, 16, 0),
      child: Column(
        children: [
          /*Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.amber,
                        radius: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(widget.freeDoc['name'],
                            style: TextStyle(
                              fontSize: 17,
                            )
                        ),
                      ),
                    ],
                  ),
                  widget.isMe? PopupMenuButton<choice>(
                    onSelected: (choice result) { setState(() {
                      if(result == choice.delete){
                        _delete();
                      }
                    }); },
                    itemBuilder: (BuildContext context) => <PopupMenuEntry<choice>>[
                      const PopupMenuItem<choice>(
                        value: choice.delete,
                        child: Text('삭제'),
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
              Text(widget.freeDoc['comment'],
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              ),
              Text(
                  DateTime.fromMicrosecondsSinceEpoch(widget.freeDoc['time'].microsecondsSinceEpoch).toString().split(" ")[0],
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                  )
              ),
            ],
          ),*/
          Container(
              width: 500,
              child: Divider( thickness: 1.0)),
        ],
      ),
    );
  }
}