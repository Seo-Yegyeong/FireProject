import 'package:flutter/material.dart';

enum Choice { Yes, No }

class RadioButtonWidget extends StatefulWidget {

  @override
  State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _RadioButtonWidgetState extends State<RadioButtonWidget> {
//처음에는 사과가 선택되어 있도록 Apple로 초기화 -> groupValue에 들어갈 값!
  Choice? _Choice = Choice.Yes;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          //ListTile - title에는 내용,
          //leading or trailing에 체크박스나 더보기와 같은 아이콘을 넣는다.
          title: Text('네', style: TextStyle(fontSize: 20, fontFamily: "DoHyeonFont"),),
          leading: Radio<Choice>(
            value: Choice.Yes,
            groupValue: _Choice,
            onChanged: (Choice? value) {
              setState(() {
                _Choice = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('아니오', style: TextStyle(fontSize: 20, fontFamily: "DoHyeonFont")),
          leading: Radio<Choice>(
            value: Choice.No,
            groupValue: _Choice,
            onChanged: (Choice? value) {
              setState(() {
                _Choice = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
