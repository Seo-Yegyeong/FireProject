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
  //late CollectionReference database;
  //FirebaseFirestore database = FirebaseFirestore.instance.collection('/teacher') as FirebaseFirestore;
  //CollectionReference database = FirebaseFirestore.instance.collection('/teacher');

  var tempID = '6KtBHm92owdhRA4PtX89l8LgP4C3';

  @override
  Widget build(BuildContext context) {
    return
        // var a = snapshot.data!.docs[i].id;
        // database = FirebaseFirestore.instance.collection('teacher').doc('a').collection('announcement');

        StreamBuilder(
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

              return Column(
                children: [
                  SizedBox(
                    height: getScreenHeight(context) * 0.7,
                    child: Column(
                      children: [
                        Divider(),
                        ListView.separated(
                          shrinkWrap: true,
                          //scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                padding: EdgeInsets.only(right: 5),
                                child: Row(
                                  children: [
                                    AnnounceCard(
                                      doc: snapshot.data!.docs[index],
                                    ),
                                    Divider(),
                                  ],
                                ));
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              thickness: 1,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            });
  }
}
