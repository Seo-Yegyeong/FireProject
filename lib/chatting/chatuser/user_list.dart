import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fireproject/chatting/chat.dart';
import 'package:fireproject/chatting/chatuser/user_card.dart';
import 'package:flutter/material.dart';

import '../chat/chat_screen.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);


  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final user = FirebaseAuth.instance.currentUser;
  CollectionReference database = FirebaseFirestore.instance.collection('chat');
  late QuerySnapshot querySnapshot;
  late Map<String, Chat> chatInfo={};
  late Set<String> connectId ={};
  //late List<Chat> chatInfo =[];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('chat').snapshots(),

      builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return const Center(
            child:CircularProgressIndicator(),
          );
        }
        if (snapshot.hasData) {
          final chatDocs = snapshot.data!.docs;

          for (int i = 0; i < chatDocs.length; i++) {
            var a = chatDocs[i];
            if (chatDocs[i]['sendId'] == user!.uid || chatDocs[i]['takeId'] == user!.uid) {
              Timestamp t = chatDocs[i]['time'];
              String time = DateTime.fromMicrosecondsSinceEpoch(t.microsecondsSinceEpoch).toString().split(" ")[0];
              Chat chat = Chat(chatDocs[i]['text'],chatDocs[i]['sendId'],chatDocs[i]['takeId'],time);

              if(chatDocs[i]['takeId']==user!.uid){
                chatInfo.putIfAbsent(chatDocs[i]['sendId'], () => chat);
                connectId.add(chatDocs[i]['sendId']);
              }
              else{
                chatInfo.putIfAbsent(chatDocs[i]['takeId'], () => chat);
                connectId.add(chatDocs[i]['takeId']);
              }

            }
          }
        }

        return ListView.builder(
          itemCount: connectId.toList().length,
          itemBuilder: (context, index){

            return GestureDetector(
              onTap: (){

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ChatScreen(connectId.toList()[index]),
                  ),
                );
              },
                child: UserCard(
                  chatInfo[connectId.toList()[index]],
                ),

            );

          },

        );
      },
    );
  }

}
