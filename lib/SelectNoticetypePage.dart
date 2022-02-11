import 'package:flutter/material.dart';

class SelectNoticetypePage extends StatelessWidget {
  const SelectNoticetypePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text("가정통신문 등록",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "DoHyeon",
            fontSize: 25.0,
          ),
        ),

        leading: Image.asset('assets/logo.png'),


      ),
      body: Column(
        children: <Widget>[

          Center(
            child: Container(
              width: 350,
              height: 230,
              margin: const EdgeInsets.only(top: 50),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),

              child: ElevatedButton(
                onPressed: () {
                  print('Elevated button');
                },
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('가정통신문',
                      style: TextStyle(
                        fontFamily: "DoHyeon",
                        fontSize: 70.0,
                        color: Color(0xFF000000),
                      ),
                    ),
                    Text('등록하기',
                      style: TextStyle(
                        fontFamily: "DoHyeon",
                        fontSize: 25.0,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 0.0,

                    primary: Color(0xFFFFC700),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    )
                ),

              ),
            ),

          ),


          Container(
            width: 350,
            height: 230,
            margin: const EdgeInsets.only(top: 50),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),

            child: ElevatedButton(
              onPressed: () {
                print('Elevated button');
              },
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('학생공지',
                    style: TextStyle(
                      fontFamily: "DoHyeon",
                      fontSize: 70.0,
                      color: Color(0xFF000000),
                    ),
                  ),
                  Text('등록하기',
                    style: TextStyle(
                      fontFamily: "DoHyeon",
                      fontSize: 25.0,
                      color: Color(0xFF000000),
                    ),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                  elevation: 0.0,

                  primary: Color(0xFF699BF7),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  )
              ),

            ),
          )

        ],

      ),
    );
  }
}







