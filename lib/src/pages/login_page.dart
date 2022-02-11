import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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