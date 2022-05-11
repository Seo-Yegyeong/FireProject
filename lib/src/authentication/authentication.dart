import 'package:firebase_auth/firebase_auth.dart';
import 'package:fireproject/bottomnavigationbar.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';

class Authentication extends StatelessWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if(!snapshot.hasData){
          return LoginPage();
        }
        else {
          return bottomNavigationbar(
            //menu: 0,
            //user: snapshot.data,
          );
          //ModifyStudentPage();
          //   Center(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Text(
          //         "${snapshot.data?.displayName}님 환영합니다.",
          //         style: const TextStyle(
          //           fontFamily: "DoHyeonFont",
          //           fontSize: 30.0,
          //           color: Color(0xFFFFFFFF),
          //         ),
          //       ),
          //       const SizedBox(
          //         height: 30,
          //       ),
          //       ElevatedButton(
          //         onPressed: FirebaseAuth.instance.signOut,
          //         child: const Text(
          //           "로그아웃",
          //           style: TextStyle(
          //             fontFamily: "DoHyeonFont",
          //             fontSize: 30.0,
          //             color: Color(0xFF000000),
          //           ),
          //         ),
          //         style: ElevatedButton.styleFrom(
          //             primary: const Color(0xFFFFC700),
          //             shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(5.0)
          //             )
          //         ),
          //       ),
          //     ],
          //   ),
          // );
        }
      },
    );
  }
}
