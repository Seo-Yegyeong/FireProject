import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fireproject/board/freeboard/freeboard_screen.dart';
import 'package:flutter/material.dart';

class FreeBoardNew extends StatefulWidget {
  const FreeBoardNew({Key? key}) : super(key: key);

  @override
  _FreeBoardNewState createState() => _FreeBoardNewState();
}

class _FreeBoardNewState extends State<FreeBoardNew> {
  var _title;
  var _content;
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('글쓰기',),

        titleTextStyle: const TextStyle(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        actions: [
          TextButton( onPressed: () {
            FirebaseFirestore.instance.collection('board/2fw6mf2i4PHLVwjp0M3m/freeboard').add(
                {
                  'content':_content,
                  'time': Timestamp.now(),
                  'title': _title,
                  'wname': user!.displayName,
                  'wid': user!.uid,
                  'cnum':0,
                  'like':0,

                });

            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => FreeBoardScreen(),

              ),
            );

          }, child: Text("완료"), ),

          ],
          ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: new InputDecoration.collapsed(
                  hintText: '제목'
              ),
          style: TextStyle(fontSize: 21, color: Colors.black),

              onChanged: (value){
                setState(() {
                  _title = value;
                });
              },
            ),
            Container(
                width: 500,
                child: Divider( thickness: 1.0)),
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: new InputDecoration.collapsed(
                  hintText: '내용을 입력하세요'
              ),
              style: TextStyle(fontSize: 21, color: Colors.black),

              onChanged: (value){
                setState(() {
                  _content = value;
                });
              },
            ),
          ],

        ),
      ),
    );

  }
}
