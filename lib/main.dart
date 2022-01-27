import 'package:fireproject/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:fireproject/start_page.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SignUpPage(),
      initialRoute: '/login',
      getPages: [
        GetPage(
          name: '/start',
          page: () => StartPage(),
        ),
        GetPage(
          name: '/signup',
          page: () => SignUpPage(),
        ),
        GetPage(
          name: '/login',
          page: () => LoginPage(),
        ),
      ],
    );
  }
}