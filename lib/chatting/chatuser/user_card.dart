import 'package:flutter/material.dart';

import '../chat.dart';
class UserCard extends StatelessWidget {
  UserCard(this.chatInfo,   {Key? key}) : super(key: key);
  Chat? chatInfo;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.amberAccent,
          child:Text("user"),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(chatInfo!.takeId),Text(chatInfo!.text),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(chatInfo!.time),
          ],
        ),
      ],
    );
  }
}

