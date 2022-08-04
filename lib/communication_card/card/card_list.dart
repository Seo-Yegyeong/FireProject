import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproject/communication_card/card/card_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardList extends StatefulWidget {
  CardList(this.id, {Key? key}) : super(key: key);
  String id;

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('communication_card/'+widget.id+'/card').snapshots(),
        builder:  (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(), //로딩되는 동그라미 보여주기
            );
          }

          final doc = snapshot.data!.docs;

          return GridView.builder(
            itemCount: doc.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              //mainAxisSpacing: 10,
              //crossAxisSpacing: 10,

            ),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: CardCard(doc[index]),
                onTap: (){
                  //Get.to(CardScreen(doc[index].id));
                },
              );
            },

          );
        },

    );
  }
}
