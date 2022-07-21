import 'package:firebase_core/firebase_core.dart';
import 'package:fireproject/src/pages/announcement/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'authentication/authentication.dart';
import 'authentication/google_login.dart';
import 'authentication/kakao_login.dart';
import 'authentication/naver_login.dart';
import 'authentication/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const TextStyle optionStyle = TextStyle(
    fontSize: 20,
    color: Color(0xFF000000),
    fontFamily: "DoHyeonFont",
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/auth',
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginPage(),
        ),
        GetPage(
          name: '/auth',
          page: () => Authentication(),
        ),
        GetPage(
          name: '/GoogleLogin',
          page: () => GoogleLogin(),
        ),
        GetPage(
          name: '/home',
          page: () => HomePage(),
        ),
      ],
    );
  }
}