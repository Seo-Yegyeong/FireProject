import 'package:cloud_firestore/cloud_firestore.dart';

class AddAnnouncement {
  final String teacherId;
  final String title;
  final String content;
  final String writer;
  final int loveCount;
  final bool sign;

  AddAnnouncement({
    required this.teacherId,
    required this.title,
    required this.content,
    required this.writer,
    required this.loveCount,
    required this.sign,
  });

  @override
  Future<void> addAnnouncement() {
    CollectionReference announcement = FirebaseFirestore.instance
        .collection('teacher')
        .doc(teacherId)
        .collection('announcement');
    print('tell me some words please');
    int size;

    return announcement.get().then((value) => { //collection 내의 document 개수를 알기 위해 씌운 코드.
      size = value.size,
    announcement
        .doc('$size')
        .set({
    'title': title,
    'content': content,
    'writer': writer,
    'loveCount': loveCount,
    'sign': sign,
    'time': DateTime.now()
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"))
    });

  }
}
