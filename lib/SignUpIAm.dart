import 'package:flutter/material.dart';

class SignUpIAm extends StatelessWidget {
  //const SignUpIAm({Key? key}) : super(key: key);
  //final ButtonStyle raisedButtonStyle= ElevatedButton. styleFrom(
  //onPrimary: Color(0xFFFFC700),
  // minimumSize: Size()
  //)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 150,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 30,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    print('Elevated button');
                  },
                  child: Text('교사', style: TextStyle(
                    fontFamily: "DoHyeon",
                    fontSize: 25.0,
                    color: Color(0xFF000000),
                  ),
                  ),
                  style: ElevatedButton.styleFrom(

                      primary: Color(0xFFFFC700),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)
                      )
                  ),
                ),
              ),

              Container(
                height: 30,
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    print('Elevated button');
                  },
                  child: Text('부모', style: TextStyle(
                    fontFamily: "DoHyeon",
                    fontSize: 25.0,
                    color: Color(0xFF000000),
                  ),
                  ),
                  style: ElevatedButton.styleFrom(

                      primary: Color(0xFFFFC700),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)
                      )
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
