import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fireproject/chatting/chatuser/user_card.dart';
import 'package:flutter/material.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);


  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final user = FirebaseAuth.instance.currentUser;
  CollectionReference database = FirebaseFirestore.instance.collection('chat');
  late QuerySnapshot querySnapshot;
  late Map<String, List<String>> chatInfo ={};
  Set<String> takeIdSet ={};



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
            if (chatDocs[i]['sendId'] == user!.uid) {
              Timestamp t = chatDocs[i]['time'];
              String time = DateTime.fromMicrosecondsSinceEpoch(t.microsecondsSinceEpoch).toString().split(" ")[0];
              chatInfo.putIfAbsent(
                  chatDocs[i]['takeId'], () => [chatDocs[i]['takeId'], chatDocs[i]['text'],time,chatDocs[i]['takeId']]);
              takeIdSet.add(chatDocs[i]['takeId']);
              print(chatInfo[chatDocs[i]['takeId']]);
              print("this");
            }
          }
        }





        return ListView.builder(
          itemCount: chatInfo.length,
          itemBuilder: (context, index){
            return UserCard(
              chatInfo[takeIdSet.toList()[index]],
            );
          },
        );
      },
    );
  }

}
