// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fireproject/src/pages/announcement/announce_detail_page.dart';
// import 'package:fireproject/src/size.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// class TeacherCard extends StatelessWidget {
//   final QueryDocumentSnapshot<Map<String, dynamic>> doc;
//
//   const TeacherCard({required this.doc});
//
//   @override
//   Widget build(BuildContext context) {
//     bool _selectedOne = false;
//     double length = getScreenWidth(context) * 0.2;
//
//     return Padding(
//       padding: EdgeInsets.only(left: 8),
//       child: SizedBox(
//         width: length,
//         height: length,
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(100),
//           child: GestureDetector(
//             onTap: () {
//               if (_selectedOne == false) {
//                 _selectedOne = true;
//                 length = getScreenWidth(context) * 0.25;
//               } else {
//                 _selectedOne = false;
//                 length = getScreenWidth(context) * 0.2;
//               }
//             },
//             child: Stack(
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         ElevatedButton(
//                           onPressed: () {},
//                           child: Text.rich(
//                             TextSpan(
//                               style: TextStyle(color: Colors.black),
//                               children: [
//                                 TextSpan(
//                                   text: doc['name'],
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           style: ButtonStyle(),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproject/src/size.dart';
import 'package:flutter/material.dart';

/*this is stless version*/

class TeacherCard extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> doc;

  const TeacherCard({required this.doc});

  @override
  Widget build(BuildContext context) {
    return stfulTeacherCard(doc: doc);
  }
}

/*this is stful version*/
class stfulTeacherCard extends StatefulWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> doc;

  const stfulTeacherCard({required this.doc});

  @override
  _stfulTeacherCardState createState() => _stfulTeacherCardState();
}

class _stfulTeacherCardState extends State<stfulTeacherCard> {
  bool isSelected = false;
  Color myColor = Color(0xFFC4C4C4);

  @override
  Widget build(BuildContext context) {
    return TeacherCardWidget();
  }

  @override
  Widget TeacherCardWidget() {
    return Padding(
      padding: EdgeInsets.only(left: 8),
      child: SizedBox(
        width: getScreenWidth(context) * 0.2,
        height: getScreenWidth(context) * 0.2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        if(isSelected == false){
                          setState(() {
                            isSelected = true;
                            myColor = Color(0xFFFFC700);
                          });
                        }
                        else{
                          setState(() {
                            isSelected = false;
                            myColor = Color(0xFFC4C4C4);
                          });
                        }
                      },
                      child: Text(
                        "아아아",
                        //doc['name'],
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(primary: myColor))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
