// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fireproject/src/authentication/login_page.dart';
// import 'package:flutter/material.dart';
//
//
// class Home extends StatelessWidget {
//   const Home({ Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: StreamBuilder(
//             stream: FirebaseAuth.instance.authStateChanges(),
//             builder: (BuildContext context, AsyncSnapshot snapshot){
//               if(!snapshot.hasData){
//                 return const LoginPage();
//               }else{
//                 return Center(child: Column(children: [
//                   Text("${snapshot.data.displayName}님 환영합니다.")
//                 ],
//                 ),
//                 );
//               }
//             })
//     );
//   }
// }