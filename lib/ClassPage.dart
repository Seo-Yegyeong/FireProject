
import 'package:flutter/material.dart';

class ClassPage extends StatelessWidget {
  const ClassPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 250,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 150,
                width: 150,

                //alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Image.asset('assets/logo.png',fit: BoxFit.cover,),
              ),
              Container(
                height: 150,
                width: 150,
                //alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Image.asset('assets/logo.png',fit: BoxFit.fill,),
              )

            ],

          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //Column(
              //children: [
              Container(
                height: 150,
                width: 150,
                //alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Image.asset('assets/logo.png',fit: BoxFit.fill,),
              ),
              Container(
                height: 150,
                width: 150,
                //alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Image.asset('assets/logo.png',fit: BoxFit.fill,),
              )
            ],
          )
        ],
        // )
        //],

      ),

    );
  }
}

