import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yemek_tarifi_odev_mobil/GlobalVariables.dart';
import 'package:yemek_tarifi_odev_mobil/services/FileService.dart';

class ImagePickerComponent extends StatefulWidget {
  @override
  _ImagePickerComponentState createState() => _ImagePickerComponentState();
}

class _ImagePickerComponentState extends State<ImagePickerComponent> {
  File _image;

  _imgFromCamera() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
      FileService.uploadFile(image);
    });
  }

  _imgFromGallery() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
      FileService.uploadFile(image);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 32,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                _showPicker(context);
              },
              child: Container(
                child: _image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.file(
                          _image,
                          width: 350,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      )
                    : GlobalVariables.FOOD_IMAGE_URL == null
                        ? Container(
                            decoration: BoxDecoration(
                                color: Color(0xffFFD050),
                                borderRadius: BorderRadius.circular(20)),
                            width: 350,
                            height: 200,
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.grey[800],
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            width: 350,
                            height: 200,
                            child:Image.network(GlobalVariables.FOOD_IMAGE_URL)
                          ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
