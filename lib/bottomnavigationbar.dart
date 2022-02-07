import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class bottomNavigationbar extends StatefulWidget {
  const bottomNavigationbar({Key? key}) : super(key: key);

  @override
  _bottomNavigationbarState createState() => _bottomNavigationbarState();
}

class _bottomNavigationbarState extends State<bottomNavigationbar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Account balance',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/newslist.svg"),
            label: '공지',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/studentstate.svg"),
            label: '학생상태',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/addlist.svg"),
            label: '공지추가',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/studentlist.svg"),
            label: '학생들',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
