import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//import 'authentication.dart';

enum Option { USER, ADMIN }

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final email = Get.arguments;
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _signInEmailController = TextEditingController();
  final TextEditingController _signInPasswordController =
  TextEditingController();
  final loginController = Get.put(LoginController());

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

  Widget _bodyWidget(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    if (email != null) {
      _signInEmailController.text = email;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          Form(
            key: _signInFormKey,
            child: Column(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Image.asset('assets/logo.PNG'),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      '우리의 소식통',
                      style: TextStyle(color: Color(0xFF000000),
                        fontSize: 35,
                        fontFamily: "DoHyeonFont",),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    emailField(),
                    const SizedBox(
                      height: 20,
                    ),
                    passwordField(),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    GestureDetector(
                      child: const Text(
                        '회원가입',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFFFFC700),
                          fontFamily: "DoHyeonFont",
                        ),
                      ),
                      onTap: () {
                        Get.toNamed('/login/signup');
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 75,
                ),
                _loginButton(),
                const SizedBox(
                  height: 33,
                ),
                const SizedBox(),
                const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginButton() {
    final MaterialStateProperty<Size> fixedSize;
    return Obx(
          () => ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFFC700)),
        ),
        onPressed: () async {

        },
        child: !loginController.isLoging.value
            ? Container(
          color: Color(0xFFFFC700),
          child: TextButton(
            child: const Text(
              '로그인',
              style: TextStyle(color: Color(0xFF000000),
                fontFamily: "DoHyeonFont",),
            ),
            onPressed: () {},
            style: TextButton.styleFrom(
              textStyle: const TextStyle(
                fontSize: 25,
                fontFamily: "CuteFont",
              ),
            ),
          ),
        )
            : const CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      controller: _signInEmailController,
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(color: Colors.black),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(20),
        border: OutlineInputBorder(),
        hintText: "아이디를 입력하세요",
      ),
      validator: (value) {
        if (value!.trim().isEmpty) {
          return '이메일을 입력하세요.';
        } else if (!value.isEmail) {
          return '이메일 형식이 아닙니다.';
        } else {
          return null;
        }
      },
    );
  }

  Widget passwordField() {
    return Obx(
          () => TextFormField(
        obscureText: !loginController.visibility.value,
        controller: _signInPasswordController,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20),
          border: const OutlineInputBorder(),
          hintText: "비밀번호 입력",
          suffixIcon: IconButton(
            onPressed: () {
              loginController.visible();
            },
            icon: Icon(
              loginController.visibility.value
                  ? Icons.visibility
                  : Icons.visibility_off,
            ),
          ),
        ),
        validator: (value) {
          if (value!.trim().isEmpty) {
            return '패스워드를 입력하세요.';
          } else {
            return null;
          }
        },
      ),
    );
  }
}

class LoginController extends GetxController {
  var visibility = false.obs;
  var isLoging = false.obs;
  var option = Option.USER.obs;

  visible() {
    visibility.value ? visibility.value = false : visibility.value = true;
    update();
  }

  loging() {
    isLoging.value = true;
    update();
  }

  notLoging() {
    isLoging.value = false;
    update();
  }
}