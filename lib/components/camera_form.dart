import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:developer';

import 'package:send_data_1/components/rounded_button.dart';
import 'package:send_data_1/preference/preferencias_usuario.dart';

class CameraForm extends StatefulWidget {
  // CameraForm({Key key}) : super(key: key);

  @override
  _CameraFormState createState() => _CameraFormState();
}

class _CameraFormState extends State<CameraForm> {
  final prefs = new PreferenciasUsuario();

  File _image;
  final picker = ImagePicker();
  String photoBase64;
  File imageResized;
  bool permission = false;
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    imageResized = await FlutterNativeImage.compressImage(pickedFile.path,
        quality: 50, targetWidth: 420, targetHeight: 720);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        List<int> imageBytes = imageResized.readAsBytesSync();
        photoBase64 = base64Encode(imageBytes);
        // List<int> imageBytes = _image.readAsBytesSync();
        // photoBase64 = base64Encode(imageBytes);
        // print('===========================================');
        // print(photoBase64);
        prefs.photo = photoBase64;
        prefs.photobool = true;
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //======================================
    Size size = MediaQuery.of(context).size; //**** => Tamanio de pantallaS
    return Column(
      children: [
        Container(
            width: size.width * 0.8,
            child: Image(
              fit: BoxFit.cover,
              image: prefs.photobool
                  ? FileImage(_image)
                  : AssetImage('lib/assets/img/imagenoavailable.png'),
            )),
        SizedBox(
          height: 15,
        ),
        RoundedButton(
          text: 'Foto',
          textcolor: Colors.white,
          onpress: () {
            print('web');
            getImage();
          },
          sizebutton: 0.8,
        )
      ],
    );
  }
}
