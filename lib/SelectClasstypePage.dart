import 'package:flutter/material.dart';

class SelectClasstypePage extends StatelessWidget {
  const SelectClasstypePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 85,
          ),
          Center(
            child: Container(
              width: 350,
              height: 230,
              margin: const EdgeInsets.only(top: 60),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),

              child: ElevatedButton(
                onPressed: () {
                  print('Elevated button');
                },
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('새로운 소식통',
                      style: TextStyle(
                        fontFamily: "DoHyeon",
                        fontSize: 25.0,
                        color: Color(0xFF000000),
                      ),
                    ),
                    Text('생성',
                      style: TextStyle(
                        fontFamily: "DoHyeon",
                        fontSize: 90.0,
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
            margin: const EdgeInsets.only(top: 60),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),

            child: ElevatedButton(
              onPressed: () {
                print('Elevated button');
              },
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('생성된 소식통',
                    style: TextStyle(
                      fontFamily: "DoHyeon",
                      fontSize: 25.0,
                      color: Color(0xFF000000),
                    ),
                  ),
                  Text('참여',
                    style: TextStyle(
                      fontFamily: "DoHyeon",
                      fontSize: 90.0,
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