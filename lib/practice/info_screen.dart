import 'package:fireproject/bottomnavigationbar.dart';
import 'package:fireproject/practice/info_list.dart';
import 'package:fireproject/practice/new_info.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("UserInfo"),
      ),
      body: Container(
          child: InfoList(),

          ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NewInfo(),
          ),
        );
      },

      ),

      );

  }

}
