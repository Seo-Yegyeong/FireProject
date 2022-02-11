import 'package:fireproject/chatting/chat/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../chat.dart';

class Messages extends StatelessWidget {
  Messages(this.takeId, {Key? key}) : super(key: key);
  String takeId;

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

        List<Chat> chatDocs = [];

        if(snapshot.hasData){
          for(int i=0; i<snapshot.data!.docs.length; i++){
            var a = snapshot.data!.docs[i];
            if(a.get('sendId')==user!.uid && a.get('takeId')==takeId){
              Timestamp t = a.get('time');
              String time = DateTime.fromMicrosecondsSinceEpoch(t.microsecondsSinceEpoch).toString().split(" ")[0];
              Chat c = Chat(a.get('text'),a.get('sendId'),a.get('takeId'),time);
              chatDocs.add(c);
              print("weel");
            }
          }

        }



        return ListView.builder(
          reverse: true,
          itemCount: chatDocs.length,
          itemBuilder: (context, index){
            return ChatBubble(
              chatDocs[index],
              chatDocs[index].sendId == user!.uid,
            );
          },
        );
      },
    );
  }
}
