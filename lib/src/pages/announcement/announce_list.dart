import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproject/src/size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'announce_card.dart';
import 'home.dart';

class AnnounceList extends StatefulWidget {
  const AnnounceList({Key? key}) : super(key: key);

  @override
  _AnnounceListState createState() => _AnnounceListState();
}

class _AnnounceListState extends State<AnnounceList> {
  late CollectionReference database;

  var tempID = '6KtBHm92owdhRA4PtX89l8LgP4C3';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('teacher')
            .doc(context.watch<AnnounceChange>().tempID.toString())
            .collection('announcement')
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          var a = FirebaseFirestore.instance
              .collection('user')
              .doc(context.watch<AnnounceChange>().tempID.toString())
              .get();

          return ListView.builder(
            shrinkWrap: true,
            //scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, int index) {
              return Row(
                children: [
                  AnnounceCard(
                    doc: snapshot.data!.docs[index],
                    writer: a,
                    docId: snapshot.data!.docs[index].id.toString(),
                  ),
                  Divider(),
                ],
              );
            },
          );
        });
  }
}
