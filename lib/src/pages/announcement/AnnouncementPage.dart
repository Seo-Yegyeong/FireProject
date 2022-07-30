import 'package:fireproject/bottomnavigationbar.dart';
import 'package:fireproject/src/components/custom_ElevatedButton.dart';
import 'package:fireproject/src/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'dart:async';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerBox extends StatefulWidget {
  const ImagePickerBox({
    Key? key,
  }) : super(key: key);

  @override
  _ImagePickerBoxState createState() => _ImagePickerBoxState();
}

class _ImagePickerBoxState extends State<ImagePickerBox> {
  PickedFile? _image;

  late var downloadUrl;
  List<Asset> images = <Asset>[];

  static const TextStyle customStyle = TextStyle(
    fontFamily: "DoHyeonFont",
    fontSize: 20.0,
  );

  void imageInitState() {
    super.initState();
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

    resultList = await MultiImagePicker.pickImages(
        maxImages: 10, enableCamera: true, selectedAssets: images);
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
  static const TextStyle customStyle =
      TextStyle(fontFamily: "DoHyeonFont", fontSize: 27.0, color: Colors.black);

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
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
              size: 30,
            ),
            //SvgPicture.asset("assets/Icons/BackButton.svg"),
            iconSize: 50.0,
            onPressed: () {
              Get.off(() => bottomNavigationbar());
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.arrow_forward_rounded,
                color: Colors.black,
                size: 30,
              ),
              iconSize: 50.0,
              onPressed: () {},
            ),
          ],
        ),
        body: FormScreen(),
        // bottomNavigationBar: buildBottomAppBar(),
      ),
    );
  }
}

enum Choice { Yes, No }

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  static const TextStyle customStyle =
      TextStyle(fontFamily: "DoHyeonFont", fontSize: 27.0, color: Colors.black);
  Choice _Choice = Choice.Yes;

  String _title = "";
  String _content = "";
  bool _sign = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        GestureDetector(
          //onTap: Focus.of().unfocus(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Form(
              key: _formKey,
              //autovalidateMode: AutovalidateMode.always,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Text(
                      "제목",
                      style: customStyle,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    onSaved: (value) {
                      setState((){
                        _title = value as String;
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "제목을 입력해주세요.";
                      } else if (value.length > 30) {
                        return "제목의 길이를 초과하였습니다.";
                      }
                      return null;
                    },
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: "제목을 입력해주세요.",
                      fillColor: Colors.grey,
                      contentPadding: const EdgeInsets.all(20),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    // onFieldSubmitted: (_){
                    //   FocusScope.of(context).requestFocus(_thisFocusNode);
                    // },
                    // onChanged: (value){
                    //
                    // },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Text(
                      "내용",
                      style: customStyle,
                    ),
                  ),
                  TextFormField(
                    onSaved: (value){
                      setState((){
                        _content = value as String;
                      });
                    },
                    onChanged: (value) {},
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "내용을 입력해주세요.";
                      } else if (value.length < 10) {
                        "10글자 이상 입력해주세요.";
                      } else if (value.length > 1000) {
                        return "제목의 길이를 초과하였습니다.";
                      }
                      return null;
                    },
                    maxLines: 15,
                    decoration: InputDecoration(
                      labelText: "내용을 입력해주세요",
                      fillColor: Colors.grey,
                      contentPadding: const EdgeInsets.all(20),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    // onFieldSubmitted: (_){
                    //   FocusScope.of(context).requestFocus(_thisFocusNode);
                    // },
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
                        Column(
                          children: <Widget>[
                            ListTile(
                              //ListTile - title에는 내용,
                              //leading or trailing에 체크박스나 더보기와 같은 아이콘을 넣는다.
                              title: Text('네', style: TextStyle(fontSize: 20, fontFamily: "DoHyeonFont"),),
                              leading: Radio<Choice>(
                                value: Choice.Yes,
                                groupValue: _Choice,
                                onChanged: (value) {
                                  setState(() {
                                    _Choice = value!;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: const Text('아니오', style: TextStyle(fontSize: 20, fontFamily: "DoHyeonFont")),
                              leading: Radio<Choice>(
                                value: Choice.No,
                                groupValue: _Choice,
                                onChanged: (value) {
                                  setState(() {
                                    _Choice = value!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        //RadioButtonWidget()
                      ],
                    ),
                  ),
                  Center(child: ImagePickerBox()),
                  const SizedBox(
                    height: 50,
                  ),
                  Custom_ElevatedButton(
                    text: '등록',
                    funPageRoute: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        Get.snackbar(
                          '저장완료!',
                          '폼 저장이 완료되었습니다!',
                          backgroundColor: Colors.white,
                        );

                        //Get.off(() => StartPage());
                      }
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
