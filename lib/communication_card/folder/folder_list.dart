import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproject/communication_card/folder/folder_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FolderList extends StatefulWidget {
  const FolderList({Key? key}) : super(key: key);

  @override
  State<FolderList> createState() => _FolderListState();
}

class _FolderListState extends State<FolderList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('communication_card').snapshots() ,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(), //로딩되는 동그라미 보여주기
          );
        }



        final doc = snapshot.data!.docs;

        return ListView.builder(
          itemCount: doc.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: FolderCard(doc[index]),
              onTap: (){
                //Get.to();
              },
            );
          },

        );
      },
    );
  }
}
