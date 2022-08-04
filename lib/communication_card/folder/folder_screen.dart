import 'package:fireproject/communication_card/folder/folder_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FolderScreen extends StatefulWidget {
  const FolderScreen({Key? key}) : super(key: key);

  @override
  State<FolderScreen> createState() => _FolderScreenState();
}

class _FolderScreenState extends State<FolderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(
              children: [
                Expanded(child: FolderList()),
              ],
            )
        ),
    );
  }
}
