import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../board/PopupMenu.dart';
import 'edit_info.dart';
enum choice{edit,delete}

class InfoCard extends StatefulWidget {
  InfoCard(this.doc, this.id,{Key? key}) : super(key: key);
  QueryDocumentSnapshot<Map<String, dynamic>> doc;
  String id;


  @override
  _InfoCardState createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Row(
              children: [
                Text("이름: "),
                Text(widget.doc['name']),
              ],
            ),
            Row(
              children: [
                Text("     나이: "),
                Text(widget.doc['age'].toString()),
              ],
            ),
          ],
        ),
        Container(

          child: PopupMenuButton<choice>(
            //icon: Icon(Icons.more_horiz),
            onSelected: (choice result) { setState(() {
              if(result == choice.edit){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditInfo(widget.id),
                  ),
                );
              }
            }); },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<choice>>[
              const PopupMenuItem<choice>(
                value: choice.edit,
                child: Text('수정'),
              ),
              const PopupMenuItem<choice>(
                value: choice.delete,
                child: Text('삭제'),
              ),
            ],
          ),
        ),


      ],
    );
  }
}