import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../bottomnavigationbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const TextStyle optionStyle = TextStyle(
    fontSize: 20,
    color: Color(0xFF000000),
    fontFamily: "DoHyeonFont",
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
  );
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text('우리의 소식통',
            style: TextStyle(
              fontFamily: "DoHyeonFont",
              fontWeight: FontWeight.bold,
              color: Color(0xFF000000),
            )),
      ),
      body: _bodyWidget(context),
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

  Widget _bodyWidget(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: <Widget>[
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      color: Colors.amber,
                      margin: EdgeInsets.all(10),
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      color: Colors.amber,
                      margin: EdgeInsets.all(10),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 5,
                  color: Colors.black12,
                ),
                Container(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 300,
                        child: Center(
                          child: Text(
                            "여기는 글을 올릴 부분입니다!! 1",
                            style: optionStyle,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 300,
                        child: Center(
                          child: Text(
                            "여기는 글을 올릴 부분입니다!! 2",
                            style: optionStyle,
                          ),
                        ),
                      ),
                      Container(
                        height: 300,
                        child: Center(
                          child: Text(
                            "여기는 글을 올릴 부분입니다!! 3",
                            style: optionStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
