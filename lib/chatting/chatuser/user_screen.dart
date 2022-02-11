import 'package:firebase_auth/firebase_auth.dart';
import 'package:fireproject/chatting/chatuser/user_list.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  UserScreen({Key? key}) : super(key: key);


  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;




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
            children: const [
              Expanded(
                child: UserList(),
              ),

            ]
        ),
      ),
    );
  }
}

