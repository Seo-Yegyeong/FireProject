// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:kakao_flutter_sdk/all.dart';
//
// class KakaoLogin extends StatefulWidget {
//   const KakaoLogin({Key? key}) : super(key: key);
//
//   @override
//   _KakaoLoginState createState() => _KakaoLoginState();
// }
//
// class _KakaoLoginState extends State<KakaoLogin> {
//
//   Future<void> _loginButtonPressed() async {
//     String authCode = await AuthCodeClient.instance.request();
//     print(authCode);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         minimum: const EdgeInsets.symmetric(horizontal: 16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget> [
//             SizedBox(
//               width: MediaQuery.of(context).size.width,
//               child: CupertinoButton(
//                 onPressed: _loginButtonPressed,
//                 color: Colors.yellow,
//                 child: Text(
//                   '카카오 로그인',
//
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
