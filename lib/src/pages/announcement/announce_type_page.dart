import 'package:fireproject/src/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AnnounceTypePage extends StatelessWidget {
  const AnnounceTypePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: getAppBarHeight(context),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/logo.svg"),
          iconSize: 50.0,
          onPressed: () {},
        ),
        title: Text(
          "공지문 선택",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "DoHyeonFont",
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: getScreenHeight(context) * 0.01,
          ),
          Center(
            child: Container(
              height: getScreenHeight(context) * 0.3,
              width: getScreenWidth(context) * 0.88,
              margin: const EdgeInsets.only(top: 60),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: ElevatedButton(
                onPressed: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text('새로운 소식통',
                    //   style: TextStyle(
                    //     fontFamily: "DoHyeon",
                    //     fontSize: 25.0,
                    //     color: Color(0xFF000000),
                    //   ),
                    // ),
                    Text(
                      '가정통신문',
                      style: TextStyle(
                        fontFamily: "DoHyeonFont",
                        fontSize: 60.0,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    primary: Color(0xFFFFC700),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
              ),
            ),
          ),
          Container(
            height: getScreenHeight(context) * 0.3,
            width: getScreenWidth(context) * 0.88,
            margin: const EdgeInsets.only(top: 60),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: ElevatedButton(
              onPressed: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text('생성된 소식통',
                  //   style: TextStyle(
                  //     fontFamily: "DoHyeon",
                  //     fontSize: 25.0,
                  //     color: Color(0xFF000000),
                  //   ),
                  // ),
                  Text(
                    '학생별 공지',
                    style: TextStyle(
                      fontFamily: "DoHyeonFont",
                      fontSize: 60.0,
                      color: Color(0xFF000000),
                    ),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  primary: Color(0xFF699BF7),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0))),
            ),
          )
        ],
      ),
    );
  }
}
