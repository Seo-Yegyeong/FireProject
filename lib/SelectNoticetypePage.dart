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

          SizedBox(
            height: 85,
          ),
          Center(
            child: Container(
                alignment: Alignment(0.0,0.0),
                decoration:  BoxDecoration(
                  color: const Color(0xFFFFC700),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                width: 320,
                height: 220,
                //margin: const EdgeInsets.only(top: 50),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),

                child:
                Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Text('가정통신문',
                        style: TextStyle(
                          fontFamily: "DoHyeon",
                          fontSize: 70.0,
                        ),
                      ),
                      Text('등록하기',
                        style: TextStyle(
                          fontFamily: "DoHyeon",
                          fontSize: 30.0,
                        ),
                      ),
                    ]
                )



            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF699BF7),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            width: 320,
            height: 220,
            margin: const EdgeInsets.only(top: 60),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),

            child:
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:const [
                  Text('학생공지',
                    style: TextStyle(
                      fontFamily: "DoHyeon",
                      fontSize: 70.0,

                    ),
                  ),
                  Text('등록하기',
                    style: TextStyle(
                      fontFamily: "DoHyeon",
                      fontSize: 30.0,
                    ),
                  ),
                ]
            ),
          )


        ],

      ),
    );
  }
}







