import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../bottomnavigationbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: <Widget>[
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      color: Colors.amber,
                      margin: EdgeInsets.all(10),
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      color: Colors.amber,
                      margin: EdgeInsets.all(10),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 5,
                  color: Colors.black12,
                ),
                Container(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 300,
                        child: Center(
                          child: Text(
                            "여기는 글을 올릴 부분입니다!! 1",
                            //style: optionStyle,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 300,
                        child: Center(
                          child: Text(
                            "여기는 글을 올릴 부분입니다!! 2",
                            //style: optionStyle,
                          ),
                        ),
                      ),
                      Container(
                        height: 300,
                        child: Center(
                          child: Text(
                            "여기는 글을 올릴 부분입니다!! 3",
                            //style: optionStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}