// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class CustomTextFormField extends StatelessWidget {
//
//   final String hint;
//   final funValidator;
//   var _content;
//
//   CustomTextFormField({required this.hint, required this.funValidator});
//
//   Widget build(BuildContext context){
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: TextFormField(
//         validator: funValidator,
//         decoration: InputDecoration(
//           labelText: "$hint",
//           fillColor: Colors.grey,
//           contentPadding: const EdgeInsets.all(20),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           errorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//           focusedErrorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//           ),
//         ),
//         onChanged: (value){
//
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String hint;
  final funValidator;
  //final myController;
  final int lineNum;

  CustomTextFormField({required this.hint, required this.funValidator, required this.lineNum,
    //  required this.myController
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  //final _thisFocusNode = FocusNode();

  get hint => widget.hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: widget.funValidator,
        //controller: widget.myController,
        //focusNode: _thisFocusNode,
        maxLines: widget.lineNum,
        decoration: InputDecoration(
          labelText: "$hint",
          fillColor: Colors.grey,
          contentPadding: const EdgeInsets.all(20),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        // onFieldSubmitted: (_){
        //   FocusScope.of(context).requestFocus(_thisFocusNode);
        // },
        onChanged: (value){

        },
      ),
    );
  }

// void dispose(){
//   _thisFocusNode.dispose();
//   super.dispose();
// }
}