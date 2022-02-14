import 'package:fireproject/board/freeboard/freeboard_screen.dart';
import 'package:flutter/material.dart';

class BoardList extends StatelessWidget {
  const BoardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('board Screen'),

        titleTextStyle: const TextStyle(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.exit_to_app_sharp,
              color: Colors.amber,
            ),
            onPressed: (){
            },
          )
        ],
      ),
    body: Container(
      child: Column(
        children: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.my_library_books,
              size: 30,
              color: Colors.amber,
            ),
            label: Text("내가 쓴 글"),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.message, size: 30),
            label: Text("내가 쓴 댓글"),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.picture_in_picture, size: 30),
            label: Text("스크랩"),
          ),
          TextButton.icon(
            onPressed: () {

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const FreeBoardScreen(),
                ),
              );
            },
            icon: Icon(Icons.free_breakfast, size: 30),
            label: Text("자유게시판"),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.ad_units, size: 30),
            label: Text("홍보게시판"),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.work, size: 30),
            label: Text("직업,취업게시판"),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.add, size: 30),
            label: Text("새내기게시판"),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.add, size: 30),
            label: Text("고민게시판"),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.info, size: 30),
            label: Text("정보게시판"),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.connect_without_contact, size: 30),
            label: Text("자조모임게시판"),
          )
        ],
      ),
    )


    );
  }
}
