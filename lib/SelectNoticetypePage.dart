import 'package:flutter/material.dart';

class SelectNoticetypePage extends StatelessWidget {
  const SelectNoticetypePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                margin: const EdgeInsets.only(top: 50),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),

                child:
                Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Text('새로운 소식통',
                        style: TextStyle(
                          fontFamily: "DoHyeon",
                          fontSize: 25.0,
                        ),
                      ),
                      Text('생성',
                        style: TextStyle(
                          fontFamily: "DoHyeon",
                          fontSize: 90.0,
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
                  Text('생성된 소식통',
                    style: TextStyle(
                      fontFamily: "DoHyeon",
                      fontSize: 25.0,

                    ),
                  ),
                  Text('참여',
                    style: TextStyle(
                      fontFamily: "DoHyeon",
                      fontSize: 90.0,
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




