import 'package:firebase_auth/firebase_auth.dart';
import 'package:fireproject/AnnouncementPage.dart';
import 'package:fireproject/practice/infor_screen.dart';
import 'package:fireproject/src/pages/announcement/home.dart';
import 'package:fireproject/src/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class bottomNavigationbar extends StatefulWidget {
  const bottomNavigationbar({Key? key, User? user}) : super(key: key);

  @override
  _bottomNavigationbarState createState() => _bottomNavigationbarState();
}

class _bottomNavigationbarState extends State<bottomNavigationbar> {
  int _selectedIndex = 0; //선택한 메뉴의 인덱스를 기억
  bool _visibility = true; //floating button의 표시 여부 결정'

  //특정 텍스트 스타일을 상수로 지정
  static const TextStyle optionStyle =
      TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);

  //메뉴별 다른 AppBar의 텍스트 지정을 위해 List<Text> 선언
  static const List<Text> _appBarOptions = <Text>[
    Text('우리의 소식통',
        style: optionStyle),
    Text('학생 의사표현', style: optionStyle,),
    Text('참여 게시판', style: optionStyle,),
    Text('○○○ 계정', style: optionStyle,),
  ];

  //메뉴별 다른 body 지정을 위해 List<Widget> 선언
  static const List<Widget> _bodyOptions = <Widget>[
    HomePage(),
    infor_screen(),
    // Text(
    //   '여기에 홈페이지 당겨오면 돼용',
    //   style: optionStyle,
    // ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Account balance',
      style: optionStyle,
    ),
  ];


  //함수 구현
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if(_selectedIndex == 0 || _selectedIndex == 2) {
      _show();
    } else {
      _hide();
    }
  }

  void _show(){
    setState(() {
      _visibility = true;
    });
  }
  void _hide(){
    setState(() {
      _visibility = false;
    });
  }

  bool _moveWritingPage() {
    bool writingType = true;

    if(_selectedIndex == 0) {
      writingType = true;
    } else if(_selectedIndex == 2) {
      writingType = false;
    }

    return writingType;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: getAppBarHeight(context),
        backgroundColor: Colors.white,
        //elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.all(5.0),
          child: _appBarOptions.elementAt(_selectedIndex),
        ),
      ),
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
      floatingActionButton: Visibility(
        child: IconButton(
          onPressed: () {
            _moveWritingPage()? WriteAnnouncePage(user: null,) : Get.toNamed('/detail');
          },
          tooltip: '글을 작성하세요.',
          icon: SvgPicture.asset("assets/Icons/pencil.svg"),
          iconSize: 55.0,
        ),
        visible: _visibility,
      ),
    );
  }
}
