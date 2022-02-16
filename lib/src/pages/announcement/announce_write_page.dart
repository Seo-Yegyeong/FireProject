// import 'package:flutter/material.dart';
//
// class AnnounceWritePage extends StatelessWidget {
//   const AnnounceWritePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CreatingAnnouncement extends StatefulWidget {
  const CreatingAnnouncement({Key? key}) : super(key: key);

  @override
  _CreatingAnnouncementState createState() => _CreatingAnnouncementState();
}

class _CreatingAnnouncementState extends State<CreatingAnnouncement> {
  FirebaseFirestore db = FirebaseFirestore.instance;
 // CollectionReference database = FirebaseFirestore.instance.collection('teacher').doc[''];
  //late QuerySnapshot querySnapshot = database.get() as QuerySnapshot<Object?>;



  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}
