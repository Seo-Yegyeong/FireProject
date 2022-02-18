import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      child: Column(children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(
                  '김한동 보호자',
                  style: TextStyle(
                    fontFamily: "DoHyeon",
                    fontSize: 25.0,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  icon: SvgPicture.asset("assets/Icons/Setting.svg"),
                  iconSize: 30.0,
                  color: Colors.black,
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: SvgPicture.asset("assets/Icons/Setting.svg"),
                  iconSize: 30.0,
                  color: Colors.black,
                  onPressed: () {},
                ),
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
            SizedBox(
              height: 15,
            ),
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
          ],
        ),
      ]),
    );
  }
}
