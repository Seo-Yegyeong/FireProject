import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage(this.takeId, {Key? key}) : super(key: key);
  final String takeId;

  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = TextEditingController();
  var _userEnterMessage = '';

  void _sendMessage(){
    FocusScope.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection('chat').add({
      'text': _userEnterMessage,
      'time': Timestamp.now(),
      'sendId': user!.uid,
      'takeId': widget.takeId,
    });
    _controller.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              cursorColor: Colors.black,
              controller: _controller,
              decoration: const InputDecoration(
                //labelText: 'Send a message...',
                  //labelStyle: TextStyle(color:Colors.amber),
                hintText: 'Send a message...',


                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber),
                  )
              ),
                onChanged: (value){
                setState(() {
                  _userEnterMessage = value;
                });
                },
            ),
          ),
          IconButton(
            onPressed: _userEnterMessage.trim().isEmpty? null : _sendMessage,
            icon: const Icon(Icons.send),
            color: Colors.amber,
          ),

        ],
      ),
    );


  }
}
