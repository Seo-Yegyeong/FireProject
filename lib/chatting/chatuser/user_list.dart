

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fireproject/chatting/chatuser/user_bubble.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('chat').orderBy('time',descending: true).snapshots(),

      builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(
            child:CircularProgressIndicator(),
          );
        }
        final chatDocs = snapshot.data!.docs;

        for(int i=0; i<;)

        return ListView.builder(
          reverse: true,
          itemCount: chatDocs.length,
          itemBuilder: (context, index){
            Set<String> userlist = {};
            if(chatDocs[index]['sendId'].toString() == user!.uid){
              userlist.add(chatDocs[index]['takeId'].toString());
            }


            return UserBubble(

            );
          },
        );
      },
    );
  }
}
