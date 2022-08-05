import 'package:fireproject/bottomnavigationbar.dart';
import 'package:fireproject/util/test_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../util/ImagePicker.dart';

class WriteAnnouncePage extends StatefulWidget {
  static const TextStyle customStyle =
  TextStyle(fontFamily: "DoHyeonFont", fontSize: 27.0, color: Colors.black);

  WriteAnnouncePage({Key? key}) : super(key: key);

  @override
  State<WriteAnnouncePage> createState() => _WriteAnnouncePageState();
}

class _WriteAnnouncePageState extends State<WriteAnnouncePage> {
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
          title: const Center(
            child: Text(
              "가정통신문 등록",
              style: WriteAnnouncePage.customStyle,
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
              size: 30,
            ),
            iconSize: 50.0,
            onPressed: () {
              Get.off(() => bottomNavigationbar());
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                "완료",
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                ),
              ),
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateColor.resolveWith((color) => Colors.white),
                  elevation:
                  MaterialStateProperty.resolveWith((elevation) => 0.0)),
            )
          ],
        ),
        body: FormScreen(),
      ),
    );
  }
}

class FormScreen extends StatefulWidget {
  FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();

  String _title = "";
  String _content = "";
  bool _sign = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }


    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TextFormField(
                    onSaved: (value) {
                      setState(() {
                        _title = value as String;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "제목을 입력해주세요.";
                      } else if (value.length > 30) {
                        return "제목의 길이를 초과하였습니다.";
                      }
                      return null;
                    },
                    maxLines: 1,
                    decoration: const InputDecoration(
                        hintText: "제목",
                        hintStyle: TextStyle(color: Colors.black45),
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder.none),
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    onSaved: (value) {
                      setState(() {
                        _content = value as String;
                      });
                    },
                    onChanged: (value) {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "내용을 입력해주세요.";
                      } else if (value.length < 10) {
                        "10글자 이상 입력해주세요.";
                      } else if (value.length > 1000) {
                        return "제목의 길이를 초과하였습니다.";
                      }
                      return null;
                    },
                    maxLines: 15,
                    decoration: const InputDecoration(
                        hintText: "내용",
                        hintStyle: TextStyle(color: Colors.black45),
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder.none),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: (){Get.to(MyHomePage());},
                  child: Text("hello", style: TextStyle(color: Colors.black),),
                ),
                const ImagePickerBox(),
                Divider(
                  thickness: 2,
                ),
                Row(
                  children: <Widget>[
                    Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          fillColor:
                          MaterialStateProperty.resolveWith(getColor),
                          value: _sign,
                          onChanged: (bool? value) {
                            setState(() {
                              _sign = value!;
                            });
                          },
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                _sign = !_sign;
                              });
                            },
                            child: Text("서명이 필요합니까?"))
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                // Custom_ElevatedButton(
                //   text: '등록',
                //   funPageRoute: () {
                //     if (_formKey.currentState!.validate()) {
                //       _formKey.currentState!.save();
                //
                //       Get.snackbar(
                //         '저장완료!',
                //         '폼 저장이 완료되었습니다!',
                //         backgroundColor: Colors.white,
                //       );
                //       User? user = FirebaseAuth.instance.currentUser;
                //       // CollectionReference announcementRef =
                //       //     FirebaseFirestore.instance.collection('teacher');
                //       //
                //       // await announcementRef.add({
                //       //   'title': _title,
                //       //   'content': _content,
                //       //   'writer': user!.displayName as String,
                //       //   'sign': _sign,
                //       //   'loveCount': 0,
                //       //   'teacherID': user.uid
                //       // });
                //       AddAnnouncement(title: _title, content: _content, writer: user!.displayName as String, sign: _sign, loveCount: 0, teacherId: user.uid).addAnnouncement();
                //       //      announcementRef.doc(user!.uid)
                //       //     .set({'title' : _title,
                //       //           'content' : _content,
                //       //           'writer' : user!.displayName as String,
                //       //   'sign' : _sign,
                //       //   'loveCount' : 0,
                //       //   'teacherID' : user.uid
                //       // });
                //
                //       Get.off(() => bottomNavigationbar());
                //     }
                //   },
                // ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
