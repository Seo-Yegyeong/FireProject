import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewComment extends StatefulWidget {
  NewComment(this.docId, {Key? key}) : super(key: key);
  String docId;

  @override
  _NewCommentState createState() => _NewCommentState();
}

class _NewCommentState extends State<NewComment> {
  final _controller = TextEditingController();
  var _userEnterMessage = '';

  void _sendMessage(){
    FocusScope.of(context).unfocus();
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection('board/2fw6mf2i4PHLVwjp0M3m/comment').add({
      'comment': _userEnterMessage,
      'time': Timestamp.now(),
      'uid': user!.uid,
      'documentId': widget.docId,
      'name': user!.displayName,
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
              decoration: InputDecoration(
                //labelText: 'Send a message...',
                //labelStyle: TextStyle(color:Colors.amber),
                hintText: 'Send a message...',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: _userEnterMessage.trim().isEmpty?Colors.grey:Colors.amberAccent, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: _userEnterMessage.trim().isEmpty?Colors.grey:Colors.amberAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                suffixIcon: IconButton(

                  onPressed: _userEnterMessage.trim().isEmpty? null : _sendMessage,
                  icon: const Icon(Icons.send,),
                  color: Colors.amber,
                ),

              ),
              onChanged: (value){
                setState(() {
                  _userEnterMessage = value;
                });
              },
            ),
          ),


        ],
      ),
    );


  }
}
