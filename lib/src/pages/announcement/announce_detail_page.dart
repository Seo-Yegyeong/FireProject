import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproject/src/pages/announcement/comment/announce_comment_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../size.dart';

class AnnounceDetailPage extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> doc;
  //final User? writer;
  String docId;

  AnnounceDetailPage({required this.doc, required this.docId,
  //  , required this.writer
  });

  @override
  Widget build(context) {
    //String data = Get.arguments;

    // var writer = FirebaseFirestore.instance
    //     .collection('user')
    //     .doc(context.watch<AnnounceChange>().tempID).snapshots().elementAt(1);

    print("야호");
    //print(writer);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: getAppBarHeight(context),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset("assets/Icons/BackButton.svg"),
        ),
        title: const Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            "우리의 소식통",
            style: TextStyle(
              color: Colors.black,
              fontFamily: "DoHyeonFont",
              fontSize: 25,
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
                      height: getScreenWidth(context) * 0.13,
                      width: getScreenWidth(context) * 0.13,
                      child: CircleAvatar(
                        backgroundColor: Colors.amberAccent,
                        child:IconButton(
                          onPressed: () {  },
                          icon: SvgPicture.asset("assets/Icons/emptyProfile.svg"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 13,
                    ),
                    Text(
                      "현창기",
                      //"writer['name']",
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
                      doc['title'],
                      style: TextStyle(fontSize: 25, fontFamily: "DoHyeonFont"),
                    ),
                    //SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          DateTime.fromMicrosecondsSinceEpoch(doc['time'].microsecondsSinceEpoch).toString().split(" ")[0],
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(doc['content']),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          height: 130,
                          width: 130,
                          color: Color(0xFFBDBDBD),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          height: 130,
                          width: 130,
                          color: Color(0xFFBDBDBD),
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
                        Text("좋아요 : "),
                        Text(doc['loveCount'].toString()),
                      ],
                    ),
                    Container(
                      width: getScreenWidth(context),
                      height: 300,
                      color: Color(0xFFBDBDBD),
                      child: AnnounceCommentList(docId),
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
