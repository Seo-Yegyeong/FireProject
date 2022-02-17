
import 'package:fireproject/practice/newinfo.dart';
import 'package:flutter/material.dart';

import 'info_list.dart';

class infor_screen extends StatelessWidget {
  const infor_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body:
      Container(
        child: info_list(),


      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => newinfo()),

          );

        },
      ),
    );
  }
}

