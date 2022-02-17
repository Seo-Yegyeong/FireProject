import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreatingClassCodePage extends StatelessWidget {
  const CreatingClassCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/BackButton.svg"),
          onPressed: () {

          },
        ),
      ),
      body: _bodyWidget(context),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    late TextEditingController _controller;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: <Widget>[
          const SizedBox(
            height: 100,
          ),
          const Center(
            child: Text(
              "새로운 소식통의 이름",
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
          NewNewsName(),
          const SizedBox(
            height: 60.0,
          ),
          const Center(
            child: Text(
              "코드 생성",
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
          CreatingCode(),
          SizedBox(
            height: 5.0,
          ),

          ButtonBar(
            children: [
              TextButton(
                onPressed: () {
                  print('Text button');
                },
                child: Text(
                  '코드 중복 확인',
                  style: TextStyle(
                    fontFamily: "DoHyeon",
                    fontSize: 20.0,
                    color: Color(0xFF000000),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: Container(
              height: 40,
              width: 350,
              child: ElevatedButton(
                onPressed: () {
                  print('Elevated button');
                },
                child: Text('생성', style: TextStyle(
                  fontFamily: "DoHyeon",
                  fontSize: 30.0,
                  color: Color(0xFF000000),
                ),
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 0.0,

                    primary: Color(0xFFFFC700),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget NewNewsName() {
    return TextFormField(
      //textAlign: TextAlign.right,
      decoration: const InputDecoration(
        labelText: "새로운 소식통의 이름을 입력하세요.",
        border: OutlineInputBorder(),
        contentPadding: const EdgeInsets.all(20),
      ),
    );
  }

  Widget CreatingCode() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "생성할 코드를 입력하세요.",
        border: OutlineInputBorder(),
        contentPadding: const EdgeInsets.all(20),
      ),
    );
  }
}