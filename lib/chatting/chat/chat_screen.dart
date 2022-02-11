import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'message.dart';
import 'new_message.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen(this.takeId, {Key? key}) : super(key: key);
  String takeId;

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser(){
    try{
      final user = _authentication.currentUser;
      if(user != null){
        loggedUser = user;
        print(loggedUser!.email);
      }
    }catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Chat Screen'),
        titleTextStyle: const TextStyle(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.exit_to_app_sharp,
              color: Colors.amber,
            ),
            onPressed: (){
              _authentication.signOut();
              Navigator.pop(context);
            },
          )
        ],
      ),

      body: Container(
        child: Column(
            children: [
              Expanded(
                child: Messages(widget.takeId),
              ),
              NewMessage(widget.takeId),
            ]
        ),
      ),
    );
  }
}
