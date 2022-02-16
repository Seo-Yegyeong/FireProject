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

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('teacher').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {

        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(
            child:CircularProgressIndicator(),
          );
        }

        return SizedBox(
          height: getScreenHeight(context) - getAppBarHeight(context)*2,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      AnnounceCard(name: snapshot.data!.docs[index]['name'], doc: snapshot.data!.docs[index],),
                    ],
                  ));
            },

          ),
        );
      },
    );
  }
}


//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'announce_card.dart';
//
// class AnnounceList extends StatefulWidget {
//   const AnnounceList({Key? key}) : super(key: key);
//
//   @override
//   _AnnounceListState createState() => _AnnounceListState();
// }
//
// class _AnnounceListState extends State<AnnounceList> {
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirebaseFirestore.instance.collection('teacher').snapshots(),
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
//
//         if(snapshot.connectionState==ConnectionState.waiting){
//           return Center(
//             child:CircularProgressIndicator(),
//           );
//         }
//         print(snapshot.data);
//         return ListView.builder(
//           itemCount: snapshot.data!.docs.length,
//           itemBuilder: (BuildContext context, int index) {
//             return AnnounceCard(snapshot.data!.docs[index]);
//           },
//
//         );
//       },
//     );
//   }
// }
