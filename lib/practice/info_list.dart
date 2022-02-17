import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproject/practice/info_card.dart';
import 'package:flutter/material.dart';

class InfoList extends StatefulWidget {
  const InfoList({Key? key}) : super(key: key);

  @override
  _InfoListState createState() => _InfoListState();
}

class _InfoListState extends State<InfoList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('practice').snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
      if(snapshot.connectionState==ConnectionState.waiting){
        return const Center(
          child:CircularProgressIndicator(),
        );
      }

          return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (BuildContext context, int index) {
            print(snapshot.data!.docs[index].id);
            return InfoCard(snapshot.data!.docs[index], snapshot.data!.docs[index].id);

    },

    );
    },
    );
  }
}
