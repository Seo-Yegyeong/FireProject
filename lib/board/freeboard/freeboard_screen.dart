import 'package:fireproject/board/freeboard/freeboard_list.dart';
import 'package:flutter/material.dart';

import 'freeboard_card.dart';
import 'freeboard_new.dart';

class FreeBoardScreen extends StatefulWidget {
  const FreeBoardScreen({Key? key}) : super(key: key);

  @override
  _FreeBoardScreenState createState() => _FreeBoardScreenState();
}

class _FreeBoardScreenState extends State<FreeBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('freeboard Screen'),

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
              Expanded(
                child: FreeBoardList(),
              ),
            ]
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
        child: FloatingActionButton(

          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => FreeBoardNew(),

              ),
            );
          },
          tooltip: 'Increment Counter',
          child: Icon(
            Icons.add,
          ),
          backgroundColor: Colors.amber,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

