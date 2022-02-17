import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fireproject/App.dart';
import 'package:flutter/material.dart';

class NewInfo extends StatefulWidget {
  const NewInfo({Key? key}) : super(key: key);

  @override
  _NewInfoState createState() => _NewInfoState();
}

class _NewInfoState extends State<NewInfo> {
  final user = FirebaseAuth.instance.currentUser;
  var _name;
  var _age;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("생성 ",),
      ),
      body:
      Container(
        child: Column(
          children: [
            Text("이름: "),
        TextField(
        onChanged: (value) {
          setState(() {
            _name = value;
          });
        },
        ),
            Text("나이: "),
            TextField(
              onChanged: (value) {
                setState(() {
                  _age= value;
                });
              },
            ),
            IconButton(
              onPressed: () {
                FirebaseFirestore.instance.collection('practice').add({
                  'name': _name,
                  'age': _age,
                });
              }, icon: Icon(Icons.send),),

          ],
        ),
      )
      ,
    );
  }
}
