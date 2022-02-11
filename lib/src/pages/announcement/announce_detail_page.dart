import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../size.dart';

class AnnounceDetailPage extends StatelessWidget {
  final int id;
  const AnnounceDetailPage(this.id);

  @override
  Widget build(BuildContext context) {
    String data = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: getAppBarHeight(context),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/Icons/BackButton.svg"),
        ),
        title: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            "우리의 소식통",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              //Text("TEST: id is $id \n\n$data"),
              Container(
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      color: Color(0xFFFFC700),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "김한동",
                      style: TextStyle(fontFamily: "DoHyeonFont", fontSize: 20),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 30,
                thickness: 1,
                color: Colors.black,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "글 제목",
                      style: TextStyle(fontSize: 25, fontFamily: "DoHyeonFont"),
                    ),
                    //SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "작성 일시   ",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("글 내용" * 100),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          height: 130,
                          width: 130,
                          color: Colors.lightGreenAccent,
                          child: Text(
                            "사진 넣을 자리",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          height: 130,
                          width: 130,
                          color: Colors.lightGreenAccent,
                          child: Text(
                            "사진 넣을 자리",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          height: 130,
                          width: 130,
                          color: Colors.lightGreenAccent,
                          child: Text(
                            "사진 넣을 자리",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 30,
                      thickness: 1,
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("좋아요랑 댓글개수 표시"),
                      ],
                    ),
                    Container(
                      width: getScreenWidth(context),
                      height: 300,
                      color: Colors.orange,
                      child: Center(
                        child: Text(
                          "댓글 부분입니당",
                        ),
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
