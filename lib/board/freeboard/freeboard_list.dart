import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fireproject/board/freeboard/freeboard_card.dart';
import 'package:fireproject/board/freeboard/freeboard_detail_screen.dart';
import 'package:flutter/material.dart';

class FreeBoardList extends StatefulWidget {
  const FreeBoardList({Key? key}) : super(key: key);

  @override
  _FreeBoardListState createState() => _FreeBoardListState();
}

class _FreeBoardListState extends State<FreeBoardList> {
  final user = FirebaseAuth.instance.currentUser;
  CollectionReference database = FirebaseFirestore.instance.collection('chat');
  late QuerySnapshot querySnapshot;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('board/2fw6mf2i4PHLVwjp0M3m/freeboard').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(
            child:CircularProgressIndicator(),
          );
        }

        final freeDocs = snapshot.data!.docs;

        return ListView.builder(
          itemCount: freeDocs.length,
          itemBuilder: (BuildContext context, int index) {

            return GestureDetector(
              onTap: (){
                print(freeDocs[index].id);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(freeDocs[index],freeDocs[index]['wid']==user!.uid,freeDocs[index].id),
                  ),
                );
              },
              child: FreeBoardCard(
                freeDocs[index],
                freeDocs[index]['wid']==user!.uid,
                freeDocs[index].id,
              ),

            );

          },

      );
    },



    );
  }
}
