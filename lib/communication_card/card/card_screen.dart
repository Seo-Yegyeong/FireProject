import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'card_list.dart';

class CardScreen extends StatefulWidget {
  CardScreen(this.id, {Key? key}) : super(key: key);
  String id;

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
            children: [
              Expanded(child: CardList(widget.id)),
            ],
          )
      ),
    );
  }
}
