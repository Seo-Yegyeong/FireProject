import 'package:fireproject/src/pages/announcement/announce_list.dart';
import 'package:fireproject/src/pages/announcement/teacher_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      child: ListView(
        children: <Widget>[
          TeacherList(),
          AnnounceList(),
        ],
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