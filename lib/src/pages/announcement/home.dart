import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../bottomnavigationbar.dart';
import 'announce_detail_page.dart';

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
                  thickness: 1,
                  color: Colors.black54,
                ),
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 300,
                        child: ListView.separated(
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {
                                Get.to(AnnounceDetailPage(index), arguments: "home.dart에서 Getx로 arguments를 넘겨준 부분이야!");
                              },
                              title: Text("제목1"),
                              leading: Text("1"),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider();
                          },
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
