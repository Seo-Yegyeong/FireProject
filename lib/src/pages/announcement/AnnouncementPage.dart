import 'package:fireproject/bottomnavigationbar.dart';
import 'package:fireproject/src/components/custom_ElevatedButton.dart';
import 'package:fireproject/src/components/custom_RadioButton.dart';
import 'package:fireproject/src/components/custom_TextFormField.dart';
import 'package:fireproject/src/size.dart';
import 'package:fireproject/start_page.dart';
import 'package:fireproject/util/validator_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'dart:async';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerBox extends StatefulWidget {
  final User? user;
  const ImagePickerBox({Key? key, required this.user}) : super(key: key);

  @override
  _ImagePickerBoxState createState() => _ImagePickerBoxState();
}

class _ImagePickerBoxState extends State<ImagePickerBox> {
  PickedFile? _image;

  late var downloadUrl;
  List<Asset> images = <Asset>[];
  String _error = 'No Error Dectected';

  late CollectionReference database;

  static const TextStyle customStyle = TextStyle(
    fontFamily: "DoHyeonFont",
    fontSize: 20.0,
  );

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
        maxImages: 10, enableCamera: true, selectedAssets: images);

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
                      style: customStyle,
                    ),
                    onPressed: () {
                      Future<bool> _getStatuses() async {
                        Map<Permission, PermissionStatus> statuses = await [
                          Permission.storage,
                          Permission.camera
                        ].request();

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
                                style: customStyle,
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
                                        style: customStyle,
                                      ),
                                    ),
                                    TextButton(

                                      //onPressed: loadAssets,
                                      onPressed: () async {
                                        //File _video;
                                        var image = await ImagePicker.platform
                                            .pickVideo(
                                            source: ImageSource.gallery);

                                        setState(() {
                                          _image = image!;
                                        });
                                      },

                                  //PickedFile? _video;

                                    //   onPressed: _pickVideo() async{
                                    // File video = await ImagePicker.pickVideo(source: ImageSource.gallery);
                                    // _video = video;
                                    // _videoPlayerController = VideoPlayerController.file(_video)..initialize().then((_) {
                                    // setState(() { });
                                    // _videoPlayerController.play();
                                    // });
                                    //
                                    // },
                                      child: const Text(
                                        "동영상 추가",
                                        style: customStyle,
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
                                        style: customStyle,
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
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
   // properties.add(DiagnosticsProperty<File>('_video', _video));
  }
}



class WriteAnnouncePage extends StatelessWidget {
  final User? user;

  WriteAnnouncePage({required this.user});

  static const TextStyle customStyle = TextStyle(
    fontFamily: "DoHyeonFont",
    fontSize: 30.0,
  );

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
          title: const Center(
            child: Text(
              "가정통신문 등록",
              style: customStyle,
            ),
          ),
          leading: IconButton(
            icon: SvgPicture.asset("assets/Icons/BackButton.svg"),
            iconSize: 50.0,
            onPressed: () {
              Get.off(()=> bottomNavigationbar());
            },
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
        // bottomNavigationBar: buildBottomAppBar(),
      ),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    // final _titleController = TextEditingController();
    // final _contentContoller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: ListView(
          children: [
            ImagePickerBox(user: user),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                "제목",
                style: customStyle,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            CustomTextFormField(
              //myController: _titleController,
              hint: '제목을 입력해주세요.',
              funValidator: validateTitle(),
              lineNum: 1,
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                "내용",
                style: customStyle,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            CustomTextFormField(
              //myController: _contentContoller,
              hint: '내용을 입력해주세요.',
              funValidator: validateContent(),
              lineNum: 15,
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 180,
              width: getScreenWidth(context) * 0.9,
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 1,
                    color: Colors.black,
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "서명이 필요한 공지인가요?",
                    style: customStyle,
                  ),
                  RadioButtonWidget(),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Custom_ElevatedButton(
              text: '등록',
              funPageRoute: () {
                if(_formKey.currentState!.validate()) {
                  Get.snackbar(
                    '저장완료!',
                    '폼 저장이 완료되었습니다!',
                    backgroundColor: Colors.white,
                  );
                  //print(_titleController.text);
                  _formKey.currentState!.save();
                  Get.off(() => StartPage());
                }

              },
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  // BottomAppBar buildBottomAppBar() {
  //   return BottomAppBar(
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.end,
  //       children: [
  //         IconButton(
  //           icon: SvgPicture.asset("assets/Icons/DeleteButton.svg"),
  //           iconSize: 30.0,
  //           onPressed: () {},
  //         ),
  //       ],
  //     ),
  //   );
}
