
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproject/practice/popupmenu.dart';
import 'package:flutter/material.dart';

class info_card extends StatelessWidget {
   info_card(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot<Map<String, dynamic>> doc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children:[
        Row(
           children:[
             Text('이름: '),
             Text(doc['name']),
           ]
          
        ),
        Row(
            children:[
              Text('나이: '),
              Text(doc['age'].toString()),
            ]

        ),
    ],
    ),
        PopupMenu(),
      ],
    );
  }
}
