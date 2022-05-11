import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fireproject/src/size.dart';
import 'package:fireproject/studentstate/screen_verStudent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ModifyStudentPage extends StatefulWidget {
  const ModifyStudentPage({Key? key}) : super(key: key);

  @override
  _ModifyStudentPageState createState() => _ModifyStudentPageState();
}

class _ModifyStudentPageState extends State<ModifyStudentPage> {
  bool click = true;
  bool isHovering = false;

  List<Color> edge = <Color>[
    Color(0XFFffffff),
    Color(0XFFffffff),
    Color(0XFFffffff),
    Color(0XFFffffff),
    Color(0XFFffffff),
    Color(0XFFffffff)
  ];

  var _selection;
  final user = FirebaseAuth.instance.currentUser;

  static const TextStyle myFontStyle = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Color(0xFF5D5D5D),
  );

  @override
  Widget build(BuildContext context) {
    const List<String> status_svg_list = <String>[
      "Good.svg",
      "Good.svg",
      "Good.svg",
      "Good.svg",
      "Good.svg",
      "Good.svg"
    ];
    const List<String> status_list = <String>[
      "좋아요",
      "기뻐요",
      "쉬고 싶어요",
      "화나요",
      "말하고 싶어요",
      "궁금해요"
    ];
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                color: edge[index],
                child: Column(
                  children: [
                    Container(
                      width: getScreenWidth(context) * 0.35,
                      height: getScreenHeight(context) * 0.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: edge[index]),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              child: IconButton(
                                icon: SvgPicture.asset(
                                    "assets/Icons/" + status_svg_list[index]),
                                iconSize: 100,
                                onPressed: () {
                                  if (isHovering == true) {
                                    setState(() {
                                      isHovering = false;
                                      for(int i=0; i<6; i++){
                                        if(i==index)
                                          edge[i] = Color(0XFF003201);
                                        else
                                          edge[i] = Color(0XFFffffff);
                                      }
                                    });
                                  } else {
                                    setState(() {
                                      isHovering = true;
                                      edge[index] = Colors.white;
                                    });
                                  }
                                  setState(() {
                                    _selection = index;
                                  });
                                },
                                color: edge[index],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 1.0,
                            width: 150,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.grey, width: 1.0),
                            ),
                          ),
                          Container(
                            child: Text(
                              status_list[index],
                              style: myFontStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      FirebaseFirestore.instance.collection('state').add({
                        'selection': _selection,
                        'name': user!.displayName,
                        'uid': user!.uid,
                        'time': Timestamp.now(),
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => screen_verStudent()));
                    },
                    child: Text(
                      '저장',
                      style: TextStyle(
                        fontFamily: "DoHyeonFont",
                        fontSize: 30.0,
                        color: Color(0xFF000000),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFFFC700),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                ),
                SizedBox(width: 16,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
