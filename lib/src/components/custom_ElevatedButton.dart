import 'package:flutter/material.dart';

class Custom_ElevatedButton extends StatelessWidget {
  final String text;
  final funPageRoute;

  const Custom_ElevatedButton({required this.text, required this.funPageRoute});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          primary: Color(0xFFFFC700),
          elevation: 5.0,
        ),
        onPressed: funPageRoute,
        child: Text("$text",
            style: TextStyle(
              fontFamily: "DoHyeonFont",
              fontSize: 30.0,
              color: Colors.black,
            )));
  }
}
