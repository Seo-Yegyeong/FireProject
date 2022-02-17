import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fireproject/src/authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // For Kakao Login
  // Future<UserCredential> signInWithKakao() async {
  //   KakaoContext.clientId = '02819f8512e479fc874e04daef7c858e';
  //
  //   String authCode = await AuthCodeClient.instance.request();
  //   print(authCode);
  //
  //   final clientState = Uuid().v4();
  //   final url = Uri.https('kauth.kakao.com', '/oauth/authorize', {
  //     'response_type': 'code',
  //     'client_id': "f6ffe0fb6ad868316948676f3e1150b8",
  //     'response_mode': 'form_post',
  //     'redirect_uri':
  //       'https://thin-savory-frigate.glitch.me/callbacks/kakao/sign_in',
  //     'state': clientState,
  //   });
  //
  //   final result = await FlutterWebAuth.authenticate(
  //     url: url.toString(), callbackUrlScheme: "webauthcallback");
  //   final body = Uri.parse(result).queryParameters;
  //   final tokenUrl = Uri.https('kauth.kakao.com', '/oauth/token', {
  //     'grant_type': 'authorization_code',
  //     'client_id': "f6ffe0fb6ad868316948676f3e1150b8",
  //     'redirect_uri':
  //       'https://thin-savory-frigate.glitch.me/callbacks/kakao/sign_in',
  //     'code': body['code'],
  //   });
  //
  //   var response = await http.post(tokenUrl);
  //   Map<String, dynamic> accessTokenResult = json.decode(response.body);
  //   var responseCustomToken = await http.post(
  //     Uri.parse("https://onyx-deep-pepperberry.glitch.me/callbacks/kakao/token"),
  //       body: {
  //         "accessToken": accessTokenResult['access_token']
  //       });
  //
  //   return await FirebaseAuth.instance.signInWithCustomToken(responseCustomToken.body);
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: _bodyWidget(),
      ),
    );
  }

  _bodyWidget() {
    return Column(
      children: [
        Center(
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Image.asset('assets/logo.png'),
              // IconButton(
              //   onPressed: () {},
              //   icon: SvgPicture.asset("assets/icons/logo.svg"),
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
                  onPressed: () {},
                  child: Text(
                    '네이버로 로그인',
                    style: TextStyle( fontFamily: "DoHyeonFont", fontSize: 30.0, color: Color(0xFF000000),),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFFFFC700),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 80,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    '카카오로 로그인',
                    style: TextStyle( fontFamily: "DoHyeonFont", fontSize: 30.0, color: Color(0xFF000000),),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFFFFC700),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0))),
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
                    final UserCredential userCredential =
                        await signInWithGoogle();

                    User? user = userCredential.user;

                    if (user != null) {
                      int i;
                      querySnapshot = await database.get();

                      for (i = 0; i < querySnapshot.docs.length; i++) {
                        var a = querySnapshot.docs[i];

                        if (a.get('uid') == user.uid) {
                          break;
                        }
                      }

                      if (i == (querySnapshot.docs.length)) {
                        database.doc(user.uid).set({
                          'email': user.email.toString(),
                          'name': user.displayName.toString(),
                          'uid': user.uid,
                        });
                      }

                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const Authentication(),
                        ),
                      );
                    }
                  },
                  child: Text(
                    '구글로 로그인',
                    style: TextStyle( fontFamily: "DoHyeonFont", fontSize: 30.0, color: Color(0xFF000000),),
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
