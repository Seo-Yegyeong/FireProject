import 'package:flutter/material.dart';
class UserCard extends StatelessWidget {
  UserCard(this.chatInfo,  {Key? key}) : super(key: key);
  List<String>? chatInfo;
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
            Text(chatInfo![0]),Text(chatInfo![1]),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(chatInfo![2]),
          ],
        ),
      ],
    );
  }
}

