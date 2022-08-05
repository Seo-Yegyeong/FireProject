import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'dart:io';
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

    resultList = await MultiImagePicker.pickImages(
        maxImages: 10, enableCamera: true, selectedAssets: images);
  }

  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
          shape: BoxShape.rectangle, color: Color(0xFFFFC700)),
      child: _image == null
          ? IconButton(
              icon: const Icon(
                Icons.camera_alt,
                size: 40,
                color: Colors.black54,
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
                                child: const Text(
                                  "사진 추가",
                                  style: customStyle,
                                ),
                              ),
                              TextButton(
                                //onPressed: loadAssets,
                                onPressed: () async {
                                  //File _video;
                                  var image = await ImagePicker
                                      .platform
                                      .pickVideo(
                                          source:
                                              ImageSource.gallery);

                                  setState(() {
                                    _image = image!;
                                  });
                                },
                                child: const Text(
                                  "동영상 추가",
                                  style: customStyle,
                                ),
                              ),
                              TextButton(
                                onPressed: () async {
                                  var image = await ImagePicker
                                      .platform
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
            )
          : ClipRect(
              child: Image.file(
                File(_image!.path),
                fit: BoxFit.fill,
              ),
            ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    // properties.add(DiagnosticsProperty<File>('_video', _video));
  }
}
