import 'package:fireproject/board/freeboard/freeboard_screen.dart';
import 'package:flutter/material.dart';

class BoardList extends StatelessWidget {
  const BoardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle myFontStyle = TextStyle(color: Colors.black, fontFamily: "DoHyeonFont", fontSize: 20);

    return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
          children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.my_library_books,
                size: 30,
                color: Colors.amber,
              ),
              label: Text("내가 쓴 글", style: myFontStyle,),
            ),
            Divider( thickness: 1,),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.message, size: 30, color: Colors.amber,),
              label: Text("내가 쓴 댓글", style: myFontStyle,),
            ),
            Divider( thickness: 1,),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.picture_in_picture, size: 30, color: Colors.amber,),
              label: Text("스크랩", style: myFontStyle,),
            ),
            Divider( thickness: 1,),
            TextButton.icon(
              onPressed: () {

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FreeBoardScreen(),
                  ),
                );
              },
              icon: Icon(Icons.free_breakfast, size: 30, color: Colors.amber,),
              label: Text("자유게시판", style: myFontStyle,),
            ),
            Divider( thickness: 1,),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.ad_units, size: 30, color: Colors.amber,),
              label: Text("홍보게시판", style: myFontStyle,),
            ),
            Divider( thickness: 1,),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.work, size: 30, color: Colors.amber,),
              label: Text("직업,취업게시판", style: myFontStyle,),
            ),
            Divider( thickness: 1,),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add, size: 30, color: Colors.amber,),
              label: Text("새내기게시판", style: myFontStyle,),
            ),
            Divider( thickness: 1,),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add, size: 30, color: Colors.amber,),
              label: Text("고민게시판", style: myFontStyle,),
            ),
            Divider( thickness: 1,),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.info, size: 30, color: Colors.amber,),
              label: Text("정보게시판", style: myFontStyle,),
            ),
            Divider( thickness: 1,),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.connect_without_contact, size: 30, color: Colors.amber,),
              label: Text("자조모임게시판", style: myFontStyle,),
            )
          ],
        ),
        ],
      ),
    )


    );
  }
}
