import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FolderScreen extends StatefulWidget {
  const FolderScreen({Key? key}) : super(key: key);

  @override
  State<FolderScreen> createState() => _FolderScreenState();
}

class _FolderScreenState extends State<FolderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.5,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0)

                  ),
                  boxShadow: [BoxShadow(
                    color: Colors.black,
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0.5, 2), // changes position of shadow
                  ),]
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/logo.png', width: 100, height: 70,),
                  Container(
                    child: Text('감정표현하기',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                      ),),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.5,
                        ),
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [BoxShadow(
                          color: Colors.black,
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0.5, 2), // changes position of shadow
                        ),]
                    ),
                  ),
                ],
              ),

            ),

          ],
        )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
