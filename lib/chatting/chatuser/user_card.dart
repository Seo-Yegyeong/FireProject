import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../src/size.dart';
import '../chat.dart';
class UserCard extends StatelessWidget {
  UserCard(this.chatInfo,   {Key? key}) : super(key: key);
  Chat? chatInfo;
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(
            width: getScreenWidth(context) * 0.1,
            child: CircleAvatar(
              backgroundColor: Colors.amberAccent,
              child:Text("user"),
            ),
          ),
          SizedBox(width: getScreenWidth(context) * 0.03,),
          Container(
            width: getScreenWidth(context) * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(chatInfo!.takeId==user!.uid?  chatInfo!.sendId : chatInfo!.takeId),
                Text(chatInfo!.text),
              ],
            ),
          ),
          SizedBox(width: getScreenWidth(context) * 0.03,),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(chatInfo!.time),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

