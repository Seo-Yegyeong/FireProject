import 'package:flutter/material.dart';
import 'package:fireproject/ClassPage.dart';
import 'package:fireproject/CreatingClassCodePage.dart';
import 'package:fireproject/ParticipateInClassPage.dart';
import 'package:fireproject/SelectNoticeTypePage.dart';
import 'package:fireproject/SignUpIAmPage.dart';
import 'package:fireproject/SignUpParentNamePage.dart';
import 'package:fireproject/SignUpPasswordPage.dart';
import 'package:fireproject/SignUpTeacherNamePage.dart';
import 'package:fireproject/WriteSchoolContentsPage.dart';

import 'SelectClasstypePage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fire Project',
      home: WriteSchoolContentsPage(),
    );
  }
}






