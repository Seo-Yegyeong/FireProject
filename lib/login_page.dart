import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  CollectionReference database = FirebaseFirestore.instance.collection('user');
  late QuerySnapshot querySnapshot;

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(),
    );
  }
  _bodyWidget(){

    return Container(
      child:
        Column(
          children: [
            Center(
              //Image.asset('assets/Icons/logo.svg'),
              child: Column(
                children:[SizedBox(
                height: 80,
              ),
                  Image.asset('assets/Icons/logo.svg'),
              // IconButton(
              //   onPressed: () {},
              //   icon: SvgPicture.asset("assets/Icons/logo.svg"),
              // ),
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
                  Container(
                    height: 80,
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        print('Elevated button');
                      },
                      child: Text('네이버로 로그인', style: TextStyle(
                        fontFamily: "DoHyeon",
                        fontSize: 30.0,
                        color: Color(0xFF000000),
                      ),
                      ),
                      style: ElevatedButton.styleFrom(

                          primary: Color(0xFFFFC700),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          )
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 80,
                    width: 300,
                    child: ElevatedButton(
                      onPressed: () {
                        print('Elevated button');
                      },
                      child: Text('카카오로 로그인', style: TextStyle(
                        fontFamily: "DoHyeon",
                        fontSize: 30.0,
                        color: Color(0xFF000000),
                      ),
                      ),
                      style: ElevatedButton.styleFrom(

                          primary: Color(0xFFFFC700),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          )
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 80,
                    width: 300,
                    child: ElevatedButton(
                        onPressed: () async {
                          final UserCredential userCredential = await signInWithGoogle();
                          User? user = userCredential.user;

                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const Home(),
                              ),
                            );
                          },

                      child: Text('구글로 로그인', style: TextStyle(
                        fontFamily: "DoHyeon",
                        fontSize: 30.0,
                        color: Color(0xFF000000),
                      ),
                      ),
                      style: ElevatedButton.styleFrom(

                          primary: Color(0xFFFFC700),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          )
                      ),
                    ),
                  ),
    ],


              ),




              ),

          ],
        )
    );
  }
}