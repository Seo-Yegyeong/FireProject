import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:uuid/uuid.dart';



class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);



  Future<UserCredential> signInWithKakao() async {
    final clientState = Uuid().v4();
    final url = Uri.https('kauth.kakao.com', '/oauth/authorize', {
      'response_type': 'code',
      'client_id': "f6ffe0fb6ad868316948676f3e1150b8",
      'response_mode': 'form_post',
      'redirect_uri':
        'https://thin-savory-frigate.glitch.me/callbacks/kakao/sign_in',
      'state': clientState,
    });

    final result = await FlutterWebAuth.authenticate(
      url: url.toString(), callbackUrlScheme: "webauthcallback");
    final body = Uri.parse(result).queryParameters;
    final tokenUrl = Uri.https('kauth.kakao.com', '/oauth/token', {
      'grant_type': 'authorization_code',
      'client_id': "f6ffe0fb6ad868316948676f3e1150b8",
      'redirect_uri':
        'https://thin-savory-frigate.glitch.me/callbacks/kakao/sign_in',
      'code': body['code'],
    });

    var response = await http.post(tokenUrl);
    Map<String, dynamic> accessTokenResult = json.decode(response.body);
    var responseCustomToken = await http.post(
      Uri.parse("https://onyx-deep-pepperberry.glitch.me/callbacks/kakao/token"),
        body: {
          "accessToken": accessTokenResult['access_token']
        });

    return await FirebaseAuth.instance.signInWithCustomToken(responseCustomToken.body);
  }


 @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return Column(
      children: [
        Center(
          //Image.asset('assets/Icons/logo.svg'),
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/logo.svg"),
              ),
              const Text(
                '우리의 소식통',
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 40,
                  fontFamily: "DoHyeonFont",
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 80,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/NaverLogin');
                  },
                  child: const Text(
                    '네이버로 로그인',
                    style: TextStyle(
                      fontFamily: "DoHyeonFont",
                      fontSize: 30.0,
                      color: Color(0xFF000000),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFFFC700),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 80,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/KakaoLogin');
                  },
                  child: const Text(
                    '카카오로 로그인',
                    style: TextStyle(
                      fontFamily: "DoHyeonFont",
                      fontSize: 30.0,
                      color: Color(0xFF000000),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFFFC700),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 80,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/GoogleLogin');
                  },
                  child: const Text(
                    '구글로 로그인',
                    style: TextStyle(
                      fontFamily: "DoHyeonFont",
                      fontSize: 30.0,
                      color: Color(0xFF000000),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFFFFC700),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
