import 'package:fireproject/src/pages/announcement/home.dart';
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

  // static const List<Widget> _appBarOptions = <Widget>[
  //   Text('우리의 소식통',
  //       style: TextStyle(
  //         fontFamily: "DoHyeonFont",
  //         fontWeight: FontWeight.bold,
  //         color: Color(0xFF000000),
  //       )),
  //   Text('학생 의사표현'),
  //   Text('참여 게시판'),
  //   Text('○○○ 계정'),
  // ];

  static const List<Widget> _bodyOptions = <Widget>[
    HomePage(),
    Text(
      '여기에 홈페이지 당겨오면 돼용',
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
        child: _bodyOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/newslist.svg"),
            label: '공지사항',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/studentstate.svg"),
            label: '학생상태',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/addlist.svg"),
            label: '참여게시판',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/studentlist.svg"),
            label: '계정',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
    );
  }
}
