import 'package:fireproject/start_page.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

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

  _bodyWidget(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    if (email != null) {
      _signInEmailController.text = email;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: <Widget>[
          Form(
            key: _signInFormKey,
            child: Column(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    Image.asset('assets/logo.PNG'),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      '우리의 소식통',
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 35,
                        fontFamily: "DoHyeonFont",
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    emailField(),
                    const SizedBox(
                      height: 20,
                    ),
                    passwordField(),
                  ],
                ),
                const SizedBox(
                  height: 65,
                ),
                _loginButton(context),
                const SizedBox(
                  height: 33,
                ),
                GestureDetector(
                  child: const Text(
                    '회원가입',
                    style: TextStyle(
                      color: Colors.black45,
                      fontFamily: "DoHyeonFont",
                      fontSize: 20,
                    ),
                  ),
                  onTap: () {
                    Get.toNamed('/signup');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    final MaterialStateProperty<Size> fixedSize;
    return
      // Obx(
      //     () =>
      ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
          MaterialStateProperty.all<Color>(const Color(0xFFFFC700)),
        ),
        onPressed: () async {
          if (_signInFormKey.currentState!.validate()) {
            //loginController.loging();
            _emailLogin();
          }
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => StartPage(
                //user: user, //homepage로 이동할 때 user 정보도 같이 넘겨준다.
              ),
            ),
          );
        },
        child:
        // !loginController.isLoging.value
        //     ?
        Container(
          height: 80,
          width: 200,
          color: const Color(0xFFFFC700),
          child: TextButton(
            child: const Text(
              '로그인',
              style: TextStyle(
                color: Color(0xFF000000),
                fontFamily: "DoHyeonFont",
                fontSize: 35,
              ),
            ),
            onPressed: () {},
          ),
        ),
        //  )
        //     : const CircularProgressIndicator(
        //   color: Colors.white,
        // ),
      );
  }

  Future<void> _emailLogin() async {
    // try {
    //   User? user = await Authentication.signInWithEmailAndPassword(
    //       _signInEmailController.text, _signInPasswordController.text);
    //   if (user != null) {
    //     // if (loginController.option.value == Option.USER) {
    //     //   Get.offNamed('/login/home');
    //     // } else {
    //     //   Get.offNamed('/login/admin');
    //     // }
    //     if (user.emailVerified) {
    //       Get.offNamed('/login/home');
    //     } else {
    //       Get.snackbar(
    //         "이메일 인증 미확인",
    //         "인증 메일을 보냈습니다. 해당 이메일을 확인하세요.🙁",
    //       );
    //       await FirebaseAuth.instance.signOut();
    //       //loginController.notLoging();
    //     }
    //   } else {
    //     //loginController.notLoging();
    //   }
    // } catch (e) {
    //   //loginController.notLoging();
    //   print('email login failed');
    //   print(e.toString());
    // }
  }

  Widget emailField() {
    return TextFormField(
      controller: _signInEmailController,
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(color: Colors.black),
      decoration: const InputDecoration(
        hintText: "이메일 주소 입력",
        border: OutlineInputBorder(),
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
    return
      // Obx(
      //     () =>
      TextFormField(
        //obscureText: !loginController.visibility.value,
        controller: _signInPasswordController,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          //contentPadding: const EdgeInsets.only(top: 16),
          border: const OutlineInputBorder(),
          hintText: "비밀번호 입력",
          suffixIcon: IconButton(
            onPressed: () {
              //loginController.visible();
            },
            icon: Icon(
              //loginController.visibility.value
              //?
                Icons.visibility
              //: Icons.visibility_off,
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
        //),
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
