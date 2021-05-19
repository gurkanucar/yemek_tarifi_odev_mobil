import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yemek_tarifi_odev_mobil/GlobalVariables.dart';
import 'package:yemek_tarifi_odev_mobil/services/FileService.dart';

class ProfileImageComponent extends StatefulWidget {
  @override
  _ProfileImageComponentState createState() => _ProfileImageComponentState();
}

class _ProfileImageComponentState extends State<ProfileImageComponent> {
  File _image;

  _imgFromCamera() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
      FileService.uploadProfileImage(image);
    });
  }

  _imgFromGallery() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
      FileService.uploadProfileImage(image);
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
                width: MediaQuery.of(context).size.height*0.2,
                height:  MediaQuery.of(context).size.height*0.2,
                child: _image != null
                    ? ClipOval(

                  child: Image.file(
                    _image,
                    fit: BoxFit.cover,
                  ),
                )
                    : GlobalVariables.PROFILE_IMAGE_URL == null
                    ? ClipOval(
                  child: FadeInImage.assetNetwork(
                    fit: BoxFit.cover,
                    placeholder: 'assets/user.png',
                    image: 'assets/user.png',
                  ),
                )
                    : Container(
                    width: MediaQuery.of(context).size.height*0.2,
                    height:  MediaQuery.of(context).size.height*0.2,
                    child:ClipOval(
                      child: Image.network(GlobalVariables.PROFILE_IMAGE_URL,fit: BoxFit.cover,),
                    )
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
