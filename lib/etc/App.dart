// import 'package:firebase_core/firebase_core.dart';
// import 'package:fireproject/src/pages/announcement/home.dart';
// import 'package:flutter/material.dart';
//
// class App extends StatelessWidget {
//   const App({ Key? key }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: Firebase.initializeApp(),
//       builder: (context, snapshot) {
//         if(snapshot.hasError){
//           return const Center(
//             child: Text("firebase load failed"),
//           );
//         }
//         if(snapshot.connectionState == ConnectionState.done){
//           return const HomePage();
//         }
//         return const CircularProgressIndicator();
//       },
//     );
//   }
// }