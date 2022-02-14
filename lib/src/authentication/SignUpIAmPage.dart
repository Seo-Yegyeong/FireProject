import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpIAmPage extends StatelessWidget {
  //const SignUpIAm({Key? key}) : super(key: key);
  //final ButtonStyle raisedButtonStyle= ElevatedButton. styleFrom(
  //onPrimary: Color(0xFFFFC700),
  // minimumSize: Size()
  //)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: SvgPicture.asset("assets/Icons/BackButton.svg"),
          onPressed: () {

          },
        ),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text("나는", style: TextStyle(
              fontFamily: "DoHyeon",
              fontSize: 30.0,
              color: Color(0xFF000000),
            ),
            ),

          ),

          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [


              Container(
                height: 40,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    print('Elevated button');
                  },
                  child: Text('교사', style: TextStyle(
                    fontFamily: "DoHyeon",
                    fontSize: 30.0,
                    color: Color(0xFF000000),
                  ),
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

              Container(
                height: 40,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    print('Elevated button');
                  },
                  child: Text('부모', style: TextStyle(
                    fontFamily: "DoHyeon",
                    fontSize: 30.0,
                    color: Color(0xFF000000),
                  ),
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
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: Container(
              height: 40,
              width: 350,
              child: ElevatedButton(
                onPressed: () {
                  print('Elevated button');
                },
                child: Text('다음', style: TextStyle(
                  fontFamily: "DoHyeon",
                  fontSize: 30.0,
                  color: Color(0xFF000000),
                ),
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 0.0,

                    primary: Color(0xFFFFC700),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}