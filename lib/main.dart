import 'package:flutter/material.dart';
import 'package:real/ClassPage.dart';
import 'package:real/SelectNoticeTypePage.dart';
import 'package:real/SignUpIAmPage.dart';

import 'SelectClasstypePage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fire Project',
      home: SignUpIAm(),
    );
  }
}















