import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WriteSchoolContentsPage extends StatelessWidget {
  const WriteSchoolContentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Row(
            children: [
              Image.asset('assets/logo.png'),
              Text(
                "가정통신문 등록",
                style: TextStyle(
                  fontFamily: "DoHyeon",
                  fontSize: 30.0,
                  color: Color(0xFF000000),
                ),
              ),
            ],
          ),
          leading:
          IconButton(
            icon: SvgPicture.asset("assets/Icons/BackButton.svg"),
            iconSize: 25.0,
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: SvgPicture.asset("assets/Icons/NextButton.svg"),
              iconSize: 50.0,
              onPressed: () {},
            ),
          ],
        ),
        body: _bodyWidget(context),
      ),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    late TextEditingController _controller;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: <Widget>[
          const SizedBox(
            height: 50,
          ),
          Container(
            child: Text(
              "제목",
              style: TextStyle(
                fontFamily: "DoHyeon",
                fontSize: 30.0,
                color: Color(0xFF000000),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Title(),
          const SizedBox(
            height: 30.0,
          ),
          Container(
            child: Text(
              "내용",
              style: TextStyle(
                fontFamily: "DoHyeon",
                fontSize: 30.0,
                color: Color(0xFF000000),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Content(),
          SizedBox(
            height: 5.0,
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  Widget Title() {
    return TextFormField(
      //textAlign: TextAlign.right,
      decoration: const InputDecoration(
        labelText: "제목을 입력해주세요.",
        border: OutlineInputBorder(),
        contentPadding: const EdgeInsets.all(20),
      ),
    );
  }

  Widget Content() {
    return TextFormField(
      maxLines: 12,
      decoration: const InputDecoration(
        labelText: "내용을 입력해주세요.",
        border: OutlineInputBorder(),
        //contentPadding: const EdgeInsets.fromLTRB(20, 300, 100, 10),
      ),
    );
  }
}
