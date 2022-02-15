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
        ),
        onPressed: funPageRoute,
        child: Text("$text"));
  }
}