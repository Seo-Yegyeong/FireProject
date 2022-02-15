import 'package:flutter/material.dart';

enum choice{edit, delete}

class PopupMenu extends StatefulWidget {
  const PopupMenu({Key? key}) : super(key: key);

  @override
  _PopupMenuState createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(

        child: PopupMenuButton<choice>(
          //icon: Icon(Icons.more_horiz),
          onSelected: (choice result) { setState(() { }); },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<choice>>[
            const PopupMenuItem<choice>(
              value: choice.edit,
              child: Text('수정'),
            ),
            const PopupMenuItem<choice>(
              value: choice.delete,
              child: Text('삭제'),
            ),
          ],
        ),
    );
  }
}
