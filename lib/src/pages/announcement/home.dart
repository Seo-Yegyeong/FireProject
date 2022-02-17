import 'package:fireproject/src/pages/announcement/announce_list.dart';
import 'package:fireproject/src/pages/announcement/teacher_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'announce_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AnnounceChange(),
      child: Material(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(0),
          child:
          ListView(
            children: <Widget>[
              Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        TeacherList(),
                        AnnounceList(),
                        SizedBox(
                          height: 300,
                          child: ListView.separated(
                            itemCount: 20,
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () {
                                  Get.to(AnnounceDetailPage(index), arguments: "home.dart에서 Getx로 arguments를 넘겨준 부분이야!");
                                },
                                title: Text("제목1"),
                                leading: Text("1"),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider();
                            },
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
      ),
    );
  }
}

class AnnounceChange with ChangeNotifier {
  String teacherID = '6KtBHm92owdhRA4PtX89l8LgP4C3';
  String get tempID => teacherID;

  void changeTeacher(tempID) {
    teacherID = tempID;
    notifyListeners();
  }
}