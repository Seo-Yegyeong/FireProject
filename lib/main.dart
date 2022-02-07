import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'App.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Flutter 비동기 실행을 위한 코드입니다.
  await Firebase.initializeApp();// Firebase 초기화
  runApp(
      const MyApp()
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Our letter',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const App(),
    );
  }
}

