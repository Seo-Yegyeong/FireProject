import 'package:flutter/material.dart';

import '../chat.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble(this.chatDocs, this.isMe, {Key? key}) : super(key: key);

  final Chat chatDocs;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            //.withOpacity(0.3)
            color: isMe? Colors.amber: Colors.grey[300],
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              topLeft: Radius.circular(12),
              bottomRight: isMe? Radius.circular(0): Radius.circular(12),
              bottomLeft: isMe? Radius.circular(12): Radius.circular(0),
            ),
          ),
          width: 145,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Text(
              chatDocs.text,
              style: TextStyle(
                //color: isMe? Colors.white : Colors.black,
                color: Colors.black,
              )),
        ),
      ],
    );
  }
}
