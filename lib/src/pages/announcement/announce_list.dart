import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproject/src/size.dart';
import 'package:flutter/material.dart';
import 'announce_card.dart';

class AnnounceList extends StatefulWidget {
  const AnnounceList({Key? key}) : super(key: key);

  @override
  _AnnounceListState createState() => _AnnounceListState();
}

class _AnnounceListState extends State<AnnounceList> {
  //late CollectionReference database;
  //FirebaseFirestore database = FirebaseFirestore.instance.collection('/teacher') as FirebaseFirestore;

  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('/teacher/rqmMgO4n8GguramQ8HQ4fCUGWCu2/announcement').snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          /*
          * 반복문으로 선생님 한명한명 거 보기
          for(선생님 전체){
            var a = snapshot.data!.docs[i].id;
            database = FirebaseFirestore.instance.collection('teacher').doc('a').collection('announcement');
            스트림빌더로 공지를 하나씩 가져오기.
          }
          *
          * */

          // for(int i = 0; i < snapshot.data!.docs.length; i++){
          //
          //   var a = snapshot.data!.docs[i].id;
          //   database = FirebaseFirestore.instance.collection('teacher').doc('a').collection('announcement');
          //
          //   print(a);
          //   return StreamBuilder(
          //     stream: FirebaseFirestore.instance.collection('teacher').doc('a').collection('announcement').snapshots(),
          //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> secondSnapshot) {
          //       if (secondSnapshot.hasError) {
          //         return Center(
          //           child: Text('Error: ${secondSnapshot.error}'),
          //         );
          //       }
          //       return Column(
          //         children: [
          //           SizedBox(
          //             height: getScreenHeight(context)*0.3,
          //             child: ListView.builder(
          //               shrinkWrap: true,
          //               scrollDirection: Axis.horizontal,
          //               itemCount: secondSnapshot.data!.docs.length,
          //               itemBuilder: (BuildContext context, int count) {
          //                 //print(secondSnapshot.data!.docs[index]['title'].toString());
          //                 return Container(
          //                     padding: EdgeInsets.all(8),
          //                     child: Row(
          //                       children: [
          //                         //AnnounceCard(name: snapshot.data!.docs[index]['name'], doc: snapshot.data!.docs[index],),
          //                         AnnounceCard(doc: secondSnapshot.data!.docs[count],),
          //                       ],
          //                     ));
          //               },
          //
          //             ),
          //           ),
          //           //AnnounceCard(name: snapshot.data!.docs[index]['name'], doc: snapshot.data!.docs[index],),
          //           //AnnounceCard(doc: snapshot.data!.docs[i],),
          //         ],
          //       );
          //     },
          //   );

          return Column(
            children: [
              SizedBox(
                height: getScreenHeight(context) * 0.3,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            AnnounceCard(
                              doc: snapshot.data!.docs[index],
                            ),

                          ],
                        ));
                  },
                ),
              ),
            ],
          );
        });
  }
}
