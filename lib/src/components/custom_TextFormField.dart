import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  final String hint;
  final funValidator;
  var _content;

  CustomTextFormField({required this.hint, required this.funValidator});

  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: funValidator,
        decoration: InputDecoration(
          labelText: "$hint",
          fillColor: Colors.grey,
          contentPadding: const EdgeInsets.all(20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onChanged: (value){

        },
      ),
    );
  }
}