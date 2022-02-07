import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpTeacherNamePage extends StatelessWidget {
  const SignUpTeacherNamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: SvgPicture.asset("assets/Icons/BackButton.svg"),
          onPressed: () {

          },
        ),
      ),
      body: _bodyWidget(context),
    );
  }

  Widget _bodyWidget(BuildContext context){
    late TextEditingController _controller;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // Form(
          //   key: ,
          // ),
          const SizedBox(
            height: 100,
          ),
          const Center(
            child: Text(
              "선생님 성함",
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
        ],

      ),
    );
  }
  Widget TeacherName(){
    return TextFormField(
      //controller: _controller,
      decoration: const InputDecoration(
          labelText: "본인의 이름을 입력하세요.",
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(3)
      ),
    );
  }



}


class MyTextFieldWidget extends StatefulWidget {
  const MyTextFieldWidget({Key? key}) : super(key: key);

  @override
  _MyTextFieldWidgetState createState() => _MyTextFieldWidgetState();
}

class _MyTextFieldWidgetState extends State<MyTextFieldWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextFormField(
          controller: _controller,
          decoration: const InputDecoration(
            //keyboardType: TextInputType.name, '본인의 이름을 입력하세요.',
              hintText: ("성함을 입력해주세요"),
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(3)
          ),
        ),
      ),
    );
  }
}

