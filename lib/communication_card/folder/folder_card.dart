
import 'package:fireproject/util/storage_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FolderCard extends StatelessWidget {
  FolderCard(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot<Map<String, dynamic>> doc;

  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();


    return Container(
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
              FutureBuilder(
                  future: storage.downloadURL("profile_image/card_image", doc['image']),
                builder: (BuildContext context, AsyncSnapshot<String> snap) {
                  if (snap.connectionState == ConnectionState.done && snap.hasData) {
                    return ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                      ),
                      child: Image.network(
                        snap.data!,
                        height: 70,
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
              //Image.asset('assets/logo.png', width: 100, height: 70,),
              Container(
                child: Text(doc['name'],
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

        );
  }
}
