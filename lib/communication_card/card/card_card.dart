//import 'dart:html';
//import 'dart:js_util';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireproject/util/storage_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardCard extends StatelessWidget {
  CardCard(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot<Map<String, dynamic>> doc;

  @override
  Widget build(BuildContext context) {

    final Storage storage = Storage();


    return Container(
      margin: EdgeInsets.all(10),
      //padding: EdgeInsets.symmetric(horizontal: 10),
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
      child: Column(
        children: [
          FutureBuilder(
            future: storage.downloadURL("profile_image/card_image", doc['image']),
            builder: (BuildContext context, AsyncSnapshot<String> snap) {
              if (snap.connectionState == ConnectionState.done && snap.hasData) {
                return ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                  ),
                  child: Image.network(
                    snap.data!,
                    height: 90,
                  ),
                );
              }
              if (snap.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              return Image.network('https://i.stack.imgur.com/l60Hf.png',
                  fit: BoxFit.cover);
            },
          ),
          Divider(color: Colors.black, thickness: 2.0),
          Text(doc['name'],
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15,
          ),),
        ],
      ),
    );
  }
}
