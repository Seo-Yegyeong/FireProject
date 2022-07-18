import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../size.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final assetname = 'assets/image.svg';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      '김한동 보호자',
                      style: TextStyle(
                        fontFamily: "DoHyeonFont",
                        fontSize: 25.0,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      height: getScreenWidth(context) * 0.13,
                      width: getScreenWidth(context) * 0.13,
                      child: CircleAvatar(
                        backgroundColor: Colors.amberAccent,
                        child: IconButton(
                          onPressed: () {},
                          icon:
                              SvgPicture.asset("assets/Icons/emptyProfile.svg"),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: [
                      Text(
                        '3',
                        style: TextStyle(
                          fontFamily: "DoHyeon",
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '게시물',
                        style: TextStyle(
                          fontFamily: "DoHyeon",
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                    ]),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '3',
                      style: TextStyle(
                        fontFamily: "DoHyeon",
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '이웃',
                      style: TextStyle(
                        fontFamily: "DoHyeon",
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [],
            ),
            SizedBox(
              height: 15,
            ),
            Divider(),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                '프로필 편집',
                style: TextStyle(
                  fontFamily: "DoHyeon",
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
            SizedBox(height: 15,),
            IconButton(icon: Icon(Icons.exit_to_app), onPressed: (){FirebaseAuth.instance.signOut();},),
            ]
        ),
      ),
    );
  }
}
