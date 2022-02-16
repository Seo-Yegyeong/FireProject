import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproject/src/pages/announcement/announce_detail_page.dart';
import 'package:fireproject/src/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AnnounceCard extends StatelessWidget {
  final String name;
  final QueryDocumentSnapshot<Map<String, dynamic>> doc;

  const AnnounceCard({required this.name, required this.doc});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SizedBox(
          width: getScreenWidth(context),
          height: getScreenHeight(context),
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
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
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
                              text: "이름: ",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            TextSpan(
                              text: doc['name'],
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
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
  }
}
