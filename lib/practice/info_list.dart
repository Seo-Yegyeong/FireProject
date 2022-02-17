
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fireproject/practice/info_card.dart';
import 'package:flutter/material.dart';

class info_list extends StatefulWidget {
  const info_list({Key? key}) : super(key: key);

  @override
  _info_listState createState() => _info_listState();
}

class _info_listState extends State<info_list> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('practice').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
                return info_card(
                    snapshot.data!.docs[index]
                );
            },

          );
      },

    );
  }
}
