import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fireproject/board/freeboard/comment/comment_card.dart';
import 'package:flutter/material.dart';

class CommentList extends StatefulWidget {
  CommentList(this.docId,{Key? key}) : super(key: key);
  String docId;

  @override
  _CommentListState createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("board/2fw6mf2i4PHLVwjp0M3m/comment").orderBy('time').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(
            child:CircularProgressIndicator(),
          );
        }
        final freeDocs = snapshot.data!.docs;
        return SizedBox(
          height:300,
          child: ListView.builder(
          itemCount: freeDocs.length,
          itemBuilder: (BuildContext context, int index) {
            if(freeDocs[index]['documentId']==widget.docId){
              return CommentCard(
                  freeDocs[index],
                freeDocs[index]['uid']==user!.uid,
                  freeDocs[index].id,
              );
            }
            else{
              return Container();//빈걸 보내서 안보이게 하기
            }
          }
          ),
        );
      },
    );
  }
}
