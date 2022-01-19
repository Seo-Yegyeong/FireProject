import 'package:flutter/material.dart';
import 'package:fireproject/SelectNoticeTypePage.dart';

import 'SelectClasstypePage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fire Project',
      home: SelectNoticetypePage(),
    );
  }
}








