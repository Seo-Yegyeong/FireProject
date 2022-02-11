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
      body: Center(
        // children: [
        //   Text("TEST: id is $id \n\n$data"),
        //   Text("글 제목"),
        //   ElevatedButton(
        //     onPressed: () {},
        //     child: Text("삭제"),
        //   )
        //   ElevatedButton(
        //     onPressed: () {},
        //     child: Text("수정"),
        //   )
        //
        //   Expanded(child: SingleChildScrollView( child: Text("글 내용"),))
        // ],
      ),
    );
  }
}
