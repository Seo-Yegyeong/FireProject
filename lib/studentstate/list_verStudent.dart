import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fireproject/studentstate/card_verStudent.dart';
import 'package:flutter/material.dart';

class list_verStudent extends StatefulWidget {
  const list_verStudent({Key? key}) : super(key: key);

  @override
  _list_verStudentState createState() => _list_verStudentState();
}

class _list_verStudentState extends State<list_verStudent> {
  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("state").orderBy('time',descending:true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
        return Center(
          child:CircularProgressIndicator(),
        );
      }
        final user = FirebaseAuth.instance.currentUser;
        var statedoc = snapshot.data!.docs;
        print(statedoc.length);
        return ListView.builder(itemCount: statedoc.length,
          itemBuilder: (BuildContext context, int index) {
          // if (user!.uid==statedoc[index]['uid']){
          //   print(statedoc[index]['uid']);
          //   return card_verStudent(
          //     statedoc[index]
          //   );
          //
          // }
          // else{
          //   return Text('');
          // }
          return card_verStudent(
              statedoc[index]
          );
          },

        );

      },
    );
  }
}
