// import 'package:fireproject/etc/start_page.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// enum Option { USER, ADMIN }
//
// class SignUpPage extends StatelessWidget {
//   SignUpPage({Key? key}) : super(key: key);
//   final email = Get.arguments;
//   final _signInFormKey = GlobalKey<FormState>();
//
//   final TextEditingController _signUpEmailController = TextEditingController();
//   final TextEditingController _signInPasswordController =
//   TextEditingController();
//   final signUpController = Get.put(SignUpController());
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           //Image.asset('assets/logo.svg'),
//           leading: IconButton(
//             icon: SvgPicture.asset(
//               "assets/icons/logo.svg",
//             ),
//             onPressed: () {
//               Get.toNamed('/');
//             },
//           ),
//           backgroundColor: Color(0xFFFFC700),
//           elevation: 0,
//           title: const Text(
//             '우리의 소식통',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         body: _bodyWidget(context),
//       ),
//     );
//   }
//
//   _bodyWidget(BuildContext context) {
//     final ThemeData theme = Theme.of(context);
//     if (email != null) {
//       _signUpEmailController.text = email;
//     }
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: ListView(
//         children: <Widget>[
//           Form(
//             key: _signInFormKey,
//             child: Column(
//               children: [
//                 Column(
//                   children: [
//                     const SizedBox(
//                       height: 100,
//                     ),
//                     emailField(),
//                     const SizedBox(
//                       height: 100,
//                     ),
//                     _certificationButton(context),
//                     const SizedBox(
//                       height: 33,
//                     ),
//                   ],
//                 ),
//                 GestureDetector(
//                   child: const Text(
//                     '이미 계정이 있으시다면 로그인하세요!',
//                     style: TextStyle(
//                       color: Colors.black45,
//                       fontFamily: "DoHyeonFont",
//                       fontSize: 20,
//                     ),
//                   ),
//                   onTap: () {
//                     Get.toNamed('/login');
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _certificationButton(BuildContext context) {
//     final MaterialStateProperty<Size> fixedSize;
//     return Obx(
//           () => ElevatedButton(
//         style: ButtonStyle(
//           backgroundColor:
//           MaterialStateProperty.all<Color>(const Color(0xFFFFC700)),
//         ),
//         onPressed: () async {
//           if (_signInFormKey.currentState!.validate()) {
//             signUpController.loging();
//             _emailLogin();
//           }
//           Navigator.of(context).pushReplacement(
//             MaterialPageRoute(
//               builder: (context) => StartPage(
//                 //user: user, //homepage로 이동할 때 user 정보도 같이 넘겨준다.
//               ),
//             ),
//           );
//         },
//         child: !signUpController.isLoging.value
//             ? Container(
//           height: 80,
//           width: 200,
//           color: const Color(0xFFFFC700),
//           child: TextButton(
//             child: const Text(
//               '인증하기',
//               style: TextStyle(
//                 color: Color(0xFF000000),
//                 fontFamily: "DoHyeonFont",
//                 fontSize: 35,
//               ),
//             ),
//             onPressed: () {
//               Get.toNamed('/start');
//             },
//           ),
//         )
//             : const CircularProgressIndicator(
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
//
//   Future<void> _emailLogin() async {
//     // try {
//     //   User? user = await Authentication.signInWithEmailAndPassword(
//     //       _signUpEmailController.text, _signInPasswordController.text);
//     //   if (user != null) {
//     //     if (loginController.option.value == Option.USER) {
//     //       Get.offNamed('/login/home');
//     //     } else {
//     //       Get.offNamed('/login/admin');
//     //     }
//     //     if (user.emailVerified) {
//     //       Get.offNamed('/login/home');
//     //     } else {
//     //       Get.snackbar(
//     //         "이메일 인증 미확인",
//     //         "인증 메일을 보냈습니다. 해당 이메일을 확인하세요.🙁",
//     //       );
//     //       await FirebaseAuth.instance.signOut();
//     //       loginController.notLoging();
//     //     }
//     //   } else {
//     //     loginController.notLoging();
//     //   }
//     // } catch (e) {
//     //   loginController.notLoging();
//     //   print('email login failed');
//     //   print(e.toString());
//     }
//   }
//
//   Widget emailField() {
//     return TextFormField(
//       //scrollPadding: EdgeInsets.symmetric(vertical: 20),
//       //controller: _signUpEmailController,
//       keyboardType: TextInputType.emailAddress,
//       style: const TextStyle(color: Colors.black),
//       decoration: InputDecoration(
//         hintText: "이메일 주소 입력",
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//       ),
//       validator: (value) {
//         if (value!.trim().isEmpty) {
//           return '이메일을 입력하세요.';
//         } else if (!value.isEmail) {
//           return '이메일 형식이 아닙니다.';
//         } else {
//           return null;
//         }
//       },
//     );
//   }
// //}
//
// class SignUpController extends GetxController {
//   var visibility = false.obs;
//   var isLoging = false.obs;
//   var option = Option.USER.obs;
//
//   visible() {
//     visibility.value ? visibility.value = false : visibility.value = true;
//     update();
//   }
//
//   loging() {
//     isLoging.value = true;
//     update();
//   }
//
//   notLoging() {
//     isLoging.value = false;
//     update();
//   }
// }