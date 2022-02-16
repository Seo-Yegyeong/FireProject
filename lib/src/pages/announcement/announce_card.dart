import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproject/src/pages/announcement/announce_detail_page.dart';
import 'package:fireproject/src/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AnnounceCard extends StatelessWidget {
  //final String name;
  final QueryDocumentSnapshot<Map<String, dynamic>> doc;

  const AnnounceCard({required this.doc});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SizedBox(
          width: getScreenWidth(context)*0.8,
          height: getScreenWidth(context)*0.5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFFFC700).withOpacity(0.4),
                        Color(0xFFFFC700).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child:
                  Column(
                    children: [
                      //Text(doc['name'],),
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
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

      // Column(
      // children: [
      //   Row(
      //     children: [
      //       Text("제목: "),
      //       Text(doc['name']),
      //     ],
      //   ),

        // Row(
        //   children: [
        //     Text("내용: "),
        //     Text(doc['content']),
        //   ],
        // ),
        // Row(
        //   children: [
        //     Text("좋아요 개수: "),
        //     Text(doc['loveCount'].toString()),
        //   ],
        // ),
        // Row(
        //   children: [
        //     Text("시간: "),
        //     Text(doc['loveCount']),
        //   ],
        // ),
        // Divider(),
    //   ],
    // );
  }
}
