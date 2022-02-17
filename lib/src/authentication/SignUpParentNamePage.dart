import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpParentNamePage extends StatelessWidget {
  const SignUpParentNamePage({Key? key}) : super(key: key);

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
              "부모님 성함",
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
          TeacherName(),
          const SizedBox(
            height: 25.0,
          ),
          const Center(
            child: Text(
              "자녀 성함",
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
          TeacherInformation(),
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
                child: Text('다음', style: TextStyle(
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

  Widget TeacherName() {
    return TextFormField(
      //controller: _controller,
      decoration: const InputDecoration(
          labelText: "  부모(본인)의 이름을 입력하세요.",
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(3)
      ),
    );
  }

  Widget TeacherInformation() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: "  자녀의 이름을 입력하세요.",
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(3)
      ),
    );
  }
}
