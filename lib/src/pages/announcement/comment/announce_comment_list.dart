import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fireproject/src/pages/announcement/comment/announce_comment_card.dart';
import 'package:flutter/material.dart';

class AnnounceCommentList extends StatefulWidget {
  AnnounceCommentList(this.docId, {Key? key}) : super(key: key);
  String docId;

  @override
  _AnnounceCommentListState createState() => _AnnounceCommentListState();
}

class _AnnounceCommentListState extends State<AnnounceCommentList> {
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
                  return AnnounceCommentCard(
                    /*freeDocs[index],
                    freeDocs[index]['uid']==user!.uid,
                    freeDocs[index].id,*/
                  );

              }
          ),
        );
      },
    );
  }
}
