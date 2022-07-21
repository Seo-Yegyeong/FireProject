import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fireproject/src/pages/announcement/announce_detail_page.dart';
import 'package:fireproject/src/size.dart';
import 'package:fireproject/util/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class AnnounceCard extends StatelessWidget {
  //final String name;
  final QueryDocumentSnapshot<Map<String, dynamic>> doc;
  String docId;

  AnnounceCard(
      {required this.doc,
      required Future<DocumentSnapshot<Map<String, dynamic>>> writer,
      required this.docId});

  @override
  Widget build(context) {
    return bodyWidget2(context);
  }

  // Padding bodyWidget1(context) {
  //   return Padding(
  //   padding: EdgeInsets.only(left: 20),
  //   child: GestureDetector(
  //     onTap: () {
  //       FocusScope.of(context).unfocus();
  //     },
  //     child: SizedBox(
  //       width: getScreenWidth(context)*0.8,
  //       height: getScreenWidth(context)*0.5,
  //       child: ClipRRect(
  //         borderRadius: BorderRadius.circular(20),
  //         child: Stack(
  //           children: [
  //             Container(
  //               decoration: BoxDecoration(
  //                 gradient: LinearGradient(
  //                   begin: Alignment.topCenter,
  //                   end: Alignment.bottomCenter,
  //                   colors: [
  //                     Color(0xFFFFC700).withOpacity(0.4),
  //                     Color(0xFFFFC700).withOpacity(0.15),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             Padding(
  //               padding: EdgeInsets.symmetric(
  //                 horizontal: 15,
  //                 vertical: 10,
  //               ),
  //               child:
  //               Column(
  //                 children: [
  //                   Text.rich(
  //                     TextSpan(
  //                       style: TextStyle(color: Colors.white),
  //                       children: [
  //                         TextSpan(
  //                           text: doc['title'],
  //                           style: TextStyle(
  //                             color: Colors.black,
  //                             fontFamily: "DoHyeonFont",
  //                             fontSize: 30,
  //                             fontWeight: FontWeight.bold,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   SizedBox(height: 10,),
  //                   Container(
  //                     height: 85,
  //                     child: Expanded(
  //                       child: Text(doc['content'], style: TextStyle(
  //                         fontSize: 15,
  //                       ),),
  //                     ),
  //                   ),
  //                   SizedBox(height: 10,),
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.end,
  //                     children: [
  //                       Text(
  //                           DateTime.fromMicrosecondsSinceEpoch(doc['time'].microsecondsSinceEpoch).toString().split(" ")[0],
  //                           style: TextStyle(
  //                             fontWeight: FontWeight.w300,
  //                           )
  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   ),
  // );
  // }
  ChangeNotifierProvider<AnnounceChange> bodyWidget2(context) {
    return ChangeNotifierProvider(
      create: (context) => AnnounceChange(),
      child: Padding(
        padding: EdgeInsets.only(left: 20),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            print(doc.id);
            Get.to(
              () => AnnounceDetailPage(doc: doc, docId: docId),
              //arguments: "home.dart에서 Getx로 arguments를 넘겨준 부분이야!"
            );
          },
          child: SizedBox(
            width: getScreenWidth(context) * 0.9,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 7,
                vertical: 3,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doc['title'],
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "DoHyeonFont",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 85,
                    child: Expanded(
                      child: Text(
                        doc['content'],
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                          DateTime.fromMicrosecondsSinceEpoch(
                                  doc['time'].microsecondsSinceEpoch)
                              .toString()
                              .split(" ")[0],
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TeacherCard extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> doc;

  const TeacherCard({required this.doc});

  @override
  Widget build(context) {
    return SizedBox(
      width: getScreenWidth(context) * 0.23,
      height: getScreenWidth(context) * 0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 70,
                  height: 70,
                  child: GestureDetector(
                    onTap: () {
                      context.read<AnnounceChange>().changeTeacher(doc.id);
                    },
                    child: profile_image(
                      doc: doc,
                    ),
                  )),
            ],
          ),
          Text(
            doc['name'],
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class profile_image extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> doc;
  const profile_image({
    Key? key,
    required this.doc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();

    return FutureBuilder(
      future: storage.downloadURL("profile_image", doc.id + ".PNG"),
      builder: (BuildContext context, AsyncSnapshot<String> snap) {
        if (snap.connectionState == ConnectionState.done && snap.hasData) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              snap.data!,
              fit: BoxFit.fitWidth,
            ),
          );
        }
        if (snap.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        return Image.network('https://i.stack.imgur.com/l60Hf.png',
            fit: BoxFit.cover);
      },
    );
  }
}
