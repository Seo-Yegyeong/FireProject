import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproject/src/pages/announcement/comment/announce_comment_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../size.dart';

class AnnounceDetailPage extends StatefulWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> doc;
  //final User? writer;
  String docId;

  AnnounceDetailPage({required this.doc, required this.docId,
  //  , required this.writer
  });

  @override
  State<AnnounceDetailPage> createState() => _AnnounceDetailPageState();
}

class _AnnounceDetailPageState extends State<AnnounceDetailPage> {
  @override
  Widget build(context) {
    //String data = Get.arguments;

    // var writer = FirebaseFirestore.instance
    //     .collection('user')
    //     .doc(context.watch<AnnounceChange>().tempID).snapshots().elementAt(1);

    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: getAppBarHeight(context),
      //   backgroundColor: Colors.white,
      //   elevation: 0.0,
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     icon: Icon(Icons.arrow_back, color: Colors.black,),
      //   ),
      //   title: Text(
      //     "가정통신문",
      //     style: TextStyle(
      //       color: Colors.black,
      //       fontFamily: "DoHyeonFont",
      //       fontSize: 25,
      //     ),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        height: getScreenWidth(context) * 0.13,
                        width: getScreenWidth(context) * 0.13,
                        child: CircleAvatar(
                          backgroundColor: Colors.amberAccent,
                          child:GestureDetector(
                            onTap: () {  },
                            child: SvgPicture.asset("assets/Icons/emptyProfile.svg"),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      widget.doc['writer'],
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
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(6.0,0,6.0,0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.doc['title'],
                        style: TextStyle(fontSize: 25, fontFamily: "DoHyeonFont"),
                      ),
                      //SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            DateTime.fromMicrosecondsSinceEpoch(widget.doc['time'].microsecondsSinceEpoch).toString().split(" ")[0],
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(widget.doc['content']),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          ImageSpace(),
                          SizedBox(
                            width: 15,
                          ),
                          ImageSpace(),
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
                          Text(widget.doc['loveCount'].toString()),
                        ],
                      ),
                      Container(
                        width: getScreenWidth(context),
                        height: 300,
                        color: Color(0xFFBDBDBD),
                        child: AnnounceCommentList(widget.docId),
                      ),
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
      floatingActionButton: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset("assets/Icons/BackButton.svg")
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
    );
  }
}

class ImageSpace extends StatelessWidget {
  const ImageSpace({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: 130,
          width: 130,
          color: Color(0xFFBDBDBD),
        ),
        Positioned(child: Text('Image'), top: 50, left: 50,),
      ],
    );
  }
}
