import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditInfo extends StatefulWidget {
  EditInfo(this.id, {Key? key}) : super(key: key);
  String id;

  @override
  _EditInfoState createState() => _EditInfoState();
}

class _EditInfoState extends State<EditInfo> {
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

                FirebaseFirestore.instance.collection('practice').doc(widget.id).update({
                  'age': _age,
                  'name': _name,

                });
                print(widget.id);
                print("here");
              }, icon: Icon(Icons.send),),

          ],
        ),
      )
      ,
    );
  }
}