import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproject/src/pages/announcement/teacher_profile.dart';
import 'package:fireproject/src/size.dart';
import 'package:flutter/material.dart';
import 'announce_card.dart';

class AnnounceList extends StatefulWidget {
  const AnnounceList({Key? key}) : super(key: key);

  @override
  _AnnounceListState createState() => _AnnounceListState();
}

//


class _AnnounceListState extends State<AnnounceList> {

  late CollectionReference database;

  @override
  // void setState((){
  //
  // });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('/teacher/6KtBHm92owdhRA4PtX89l8LgP4C3/announcement').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {

        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(
            child:CircularProgressIndicator(),
          );
        }


        // for(int i = 0; i < snapshot.data!.docs.length; i++){
        //
        //   var a = snapshot.data!.docs[i].id;
        //   database = FirebaseFirestore.instance.collection('teacher').doc('a').collection('announcement');
        //
        //   print(a);
          // StreamBuilder(
          //   stream: database.snapshots(),
          //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> secondSnapshot) {
          //     if (secondSnapshot.hasError) {
          //       return Center(
          //         child: Text('Error: ${secondSnapshot.error}'),
          //       );
          //     }
          //     return Column(
          //       children: [
          //         SizedBox(
          //           height: getScreenHeight(context)*0.3,
          //           child: ListView.builder(
          //             shrinkWrap: true,
          //             scrollDirection: Axis.horizontal,
          //             itemCount: secondSnapshot.data!.docs.length,
          //             itemBuilder: (BuildContext context, int index) {
          //               return Container(
          //                   padding: EdgeInsets.all(8),
          //                   child: Row(
          //                     children: [
          //                       //AnnounceCard(name: snapshot.data!.docs[index]['name'], doc: snapshot.data!.docs[index],),
          //                       AnnounceCard(doc: snapshot.data!.docs[index],),
          //                     ],
          //                   ));
          //             },
          //
          //           ),
          //         ),
          //         //AnnounceCard(name: snapshot.data!.docs[index]['name'], doc: snapshot.data!.docs[index],),
          //         //AnnounceCard(doc: snapshot.data!.docs[i],),
          //       ],
          //     );
          //   },
          // );}

        return Column(
          children: [
            // SizedBox(
            //   height: getAppBarHeight(context)*1.5,
            //   child: ListView.builder(
            //     shrinkWrap: true,
            //     scrollDirection: Axis.horizontal,
            //     itemCount: snapshot.data!.docs.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       return Container(
            //           padding: EdgeInsets.symmetric(horizontal: 2),
            //           child: Row(
            //             children: [
            //               TeacherCard(name: snapshot.data!.docs[index]['name']),
            //             ],
            //           ));
            //     },
            //
            //   ),
            // ),
            const Divider(
              thickness: 1,
              color: Colors.black54,
            ),
            SizedBox(
              height: getScreenHeight(context)*0.3,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          //AnnounceCard(name: snapshot.data!.docs[index]['name'], doc: snapshot.data!.docs[index],),
                          AnnounceCard(doc: snapshot.data!.docs[index],),
                        ],
                      ));
                },

              ),
            ),
          ],
        );
      },
    );
  }
}