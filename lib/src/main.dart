import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'authentication/authentication.dart';
import 'authentication/google_login.dart';
import 'authentication/kakao_login.dart';
import 'authentication/naver_login.dart';
import 'pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
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
          name: '/NaverLogin',
          page: () => NaverLogin(),
        ),
        GetPage(
          name: '/KakaoLogin',
          page: () => KakaoLogin(),
        ),
      ],
    );
  }
}