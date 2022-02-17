import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproject/src/size.dart';
import 'package:flutter/material.dart';

class TeacherCard extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> doc;

  const TeacherCard({required this.doc});

  @override
  Widget build(BuildContext context) {
    bool isSelected = false;
    Color myColor = Color(0xFFC4C4C4);
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
                        // if(isSelected == false){
                        //   setState(() {
                        //     isSelected = true;
                        //     myColor = Color(0xFFFFC700);
                        //   });
                        // }
                        // else{
                        //   setState(() {
                        //     isSelected = false;
                        //     myColor = Color(0xFFC4C4C4);
                        //   });
                        // }
                      },
                      child: Text(
                        doc['name'],
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      // style: ElevatedButton.styleFrom(primary: myColor, shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      //     RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(100),
                      //     )
                      //   )
                      // )
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