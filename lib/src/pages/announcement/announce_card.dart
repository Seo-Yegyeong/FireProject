import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproject/src/pages/announcement/announce_detail_page.dart';
import 'package:fireproject/src/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class AnnounceCard extends StatelessWidget {
  //final String name;
  final QueryDocumentSnapshot<Map<String, dynamic>> doc;

  const AnnounceCard({required this.doc, required Future<DocumentSnapshot<Map<String, dynamic>>> writer});


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
              Get.to(() => AnnounceDetailPage(doc: doc),
                //arguments: "home.dart에서 Getx로 arguments를 넘겨준 부분이야!"
              );
            },
            child: SizedBox(
              width: getScreenWidth(context)*0.9,
              height: getScreenWidth(context)*0.5,
              child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child:
                    Column(
                      children: [
                        Text.rich(
                          TextSpan(
                            style: TextStyle(color: Colors.white),
                            children: [
                              TextSpan(
                                text: doc['title'],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "DoHyeonFont",
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          height: 85,
                          child: Expanded(
                            child: Text(doc['content'], style: TextStyle(
                              fontSize: 15,
                            ),),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                                DateTime.fromMicrosecondsSinceEpoch(doc['time'].microsecondsSinceEpoch).toString().split(" ")[0],
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                )
                            ),
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
    // bool isSelected = false;
    // Color myColor = Color(0xFFC4C4C4);
    return Padding(
        padding: EdgeInsets.only(left: 10),
        child: SizedBox(
          width: getScreenWidth(context) * 0.23,
          height: getScreenWidth(context) * 0.3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      child: ElevatedButton(
                        onPressed: (){
                          print(doc.id);
                          context.read<AnnounceChange>().changeTeacher(doc.id);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(side: BorderSide.none),
                          primary: Color(0xFFFFC700),
                          elevation: 5.0,
                        ),
                        child: Text(
                          doc['name'],
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }
}