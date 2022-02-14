import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'dart:async';
import 'package:video_player/video_player.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerBox extends StatefulWidget {
  final User? user;
  const ImagePickerBox({Key? key, required this.user}) : super(key: key);

  @override
  _ImagePickerBoxState createState() => _ImagePickerBoxState();
}

class _ImagePickerBoxState extends State<ImagePickerBox> {
  PickedFile? _image;
  //File _video;
  //late Reference firebaseStorageRef;
  //late UploadTask uploadTask;
  late var downloadUrl;
  List<Asset> images = <Asset>[];
  String _error = 'No Error Dectected';

  late CollectionReference database;

  void imageInitState() {
    super.initState();
  }

  @override
  void initState() {
    super.initState();
    database = FirebaseFirestore.instance
        .collection('user')
        .doc(widget.user!.uid)
        .collection('Product');
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    // try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 10,
        enableCamera: true,
        selectedAssets: images);


        // cupertinoOptions: CupertinoOptions(
        //   takePhotoIcon: "chat",
        //   doneButtonTitle: "Fatto",
        // ),
        // materialOptions: MaterialOptions(
        //   actionBarColor: "#abcdef",
        //   actionBarTitle: "Example App",
        //   allViewTitle: "All Photos",
        //   useDetailsView: false,
        //   selectCircleStrokeColor: "#000000",
        // ),
    //   );
    // } on Exception catch (e) {
    //   error = e.toString();
    // }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    // if (!mounted) return;

    // setState(() {
    //   images = resultList;
    //   _error = error;
    // });
  }

  Widget build(BuildContext context) {
    return Container(
      height: 170,
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
      // decoration: BoxDecoration(a
      //     color: Color(0xFF8EB680), borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                    shape: BoxShape.rectangle, color: Color(0xFFFFC700)),
                child: _image == null
                    ? IconButton(
                        icon: const Icon(
                          Icons.add,
                          size: 40,
                        ),
                        onPressed: loadAssets,
                      )
                    : ClipRect(
                        child: Image.file(
                          File(_image!.path),
                          fit: BoxFit.fill,
                        ),
                      ),
              ),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Color(0xFFFFC700)),
                    child: Text(
                      '사진 및 동영상 선택',
                      style: TextStyle(
                        fontFamily: "DoHyeon",
                        fontSize: 20.0,
                        color: Color(0xFF000000),
                      ),
                    ),
                    onPressed: (

                        ) {
                      Future<bool> _getStatuses() async {
                        Map<Permission, PermissionStatus> statuses =
                        await [Permission.storage, Permission.camera].request();

                        if (await Permission.camera.isGranted &&
                            await Permission.storage.isGranted) {
                          return Future.value(true);
                        } else {
                          return Future.value(false);
                        }
                      }

                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                '사진 및 동영상 선택',
                                style: TextStyle(
                                  fontFamily: "DoHyeon",
                                  fontSize: 20.0,
                                  color: Color(0xFF000000),
                                ),
                              ),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: [
                                    TextButton(
                                      onPressed: loadAssets,
                                      // async {
                                      //   var multiImagePicker;
                                      //   var image = await multiImagePicker.platform
                                      //       .pickImage(
                                      //           source: ImageSource.gallery);
                                      //   setState(() {
                                      //     _image = image!;
                                      //   });
                                      // },
                                      child: const Text(
                                        "사진 추가",
                                        style: TextStyle(
                                          fontFamily: "DoHyeon",
                                          fontSize: 15.0,
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      //onPressed: loadAssets,
                                      onPressed: () async {
                                        var image = await ImagePicker.platform
                                            .pickVideo(
                                                source: ImageSource.gallery);
                                        setState(() {
                                          _image = image!;
                                        });
                                      },
                                      child: const Text(
                                        "동영상 추가",
                                        style: TextStyle(
                                          fontFamily: "DoHyeon",
                                          fontSize: 15.0,
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        var image = await ImagePicker.platform
                                            .pickImage(
                                                source: ImageSource.camera);
                                        setState(() {
                                          _image = image!;
                                        });
                                      },
                                      child: const Text(
                                        "카메라",
                                        style: TextStyle(
                                          fontFamily: "DoHyeon",
                                          fontSize: 15.0,
                                          color: Color(0xFF000000),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}

class WriteSchoolContentsPage extends StatelessWidget {
  final User? user;
  WriteSchoolContentsPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Center(
            child: const Text(
              "가정통신문 등록",
              style: TextStyle(
                fontFamily: "DoHyeon",
                fontSize: 20.0,
                color: Color(0xFF000000),
              ),
            ),
          ),
          leading: IconButton(
            icon: SvgPicture.asset("assets/Icons/BackButton.svg"),
            iconSize: 50.0,
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: SvgPicture.asset("assets/Icons/NextButton.svg"),
              iconSize: 50.0,
              onPressed: () {},
            ),
          ],
        ),
        body: _bodyWidget(context),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {},
          child: IconButton(
            icon: SvgPicture.asset("assets/Icons/DeleteButton.svg"),
            iconSize: 25.0,
            onPressed: () {},
          ),
        ),
        // bottomNavigationBar: BottomAppBar(
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     children: [
        //       IconButton(
        //         icon: SvgPicture.asset("assets/Icons/Delete.svg"),
        //         iconSize: 25.0,
        //         onPressed: () {},
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    late TextEditingController _controller;
    //bool isButtonActive = true;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: <Widget>[
          // const SizedBox(
          //   height: 10,
          // ),
          ImagePickerBox(user: user),
          // const SizedBox(
          //   height: 10,
          // ),
          Container(
            child: Text(
              "제목",
              style: TextStyle(
                fontFamily: "DoHyeon",
                fontSize: 30.0,
                color: Color(0xFF000000),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Title(),
          const SizedBox(
            height: 30.0,
          ),
          Container(
            child: Text(
              "내용",
              style: TextStyle(
                fontFamily: "DoHyeon",
                fontSize: 30.0,
                color: Color(0xFF000000),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Content(),
          SizedBox(
            height: 5.0,
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: 180,
            width: 70,
            decoration: BoxDecoration(
                border: Border.all(
              width: 1,
              color: Colors.black,
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "서명이 필요한 공지인가요?",
                  style: TextStyle(
                    fontFamily: "DoHyeon",
                    fontSize: 30.0,
                    color: Color(0xFF000000),
                  ),
                ),
                RadioButtonWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget Title() {
    return TextFormField(
      decoration: const InputDecoration(
        fillColor: Colors.grey,
        labelText: "제목을 입력해주세요.",
        border: OutlineInputBorder(),
        contentPadding: const EdgeInsets.all(20),
      ),
    );
  }

  Widget Content() {
    return TextFormField(
      maxLines: 12,
      decoration: const InputDecoration(
        fillColor: Colors.grey,
        labelText: "내용을 입력해주세요.",
        border: OutlineInputBorder(),
        //contentPadding: const EdgeInsets.fromLTRB(20, 300, 100, 10),
      ),
    );
  }
}

enum Choice { Yes, No }

class RadioButtonWidget extends StatefulWidget {
  const RadioButtonWidget({Key? key}) : super(key: key);

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
          title: const Text('네'),
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
          title: const Text('아니오'),
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
