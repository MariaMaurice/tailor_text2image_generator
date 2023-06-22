import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gp/providers/AuthService.dart';
import 'package:gp/providers/DataBase.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:sizer/sizer.dart';
import 'package:gp/Screens/DisplayImage.dart';
import 'package:image_downloader/image_downloader.dart';
import '../Constants/AppColours.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class DefultButton extends StatefulWidget {
  final String text, toWhere;

  final String nwAT;
  const DefultButton(
      {Key? key, required this.text, required this.toWhere, required this.nwAT})
      : super(key: key);
  @override
  _DefultButton createState() => _DefultButton(text, toWhere, nwAT);
}

class _DefultButton extends State<DefultButton> {
  final String text, toWhere;
  String nwAT;
  String text2 = "Saving...";
  String text3 = "Saved";

  _DefultButton(this.text, this.toWhere, this.nwAT);

  bool isLoading = false;
  bool isSaved = false;

  void initState() {
    isLoading = false;
    isSaved = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 7.w),
      child: FloatingActionButton.extended(
          shape: Border.all(
            width: 5,
          ),
          onPressed: () async {
            if (nwAT == 'home') {
              if (DisplayImage.text == '') {
                showSnackBar(
                    context, "Please enter your imagine about your dress");
              } else {
                Navigator.pushReplacementNamed(context, toWhere);
              }
            } else if (nwAT == 'imageTogallery') {
              for (int i = 0; i < DisplayImage.saveGallaryImg.length; i++) {
                await ImageGallerySaver.saveImage(
                    Uint8List.fromList(DisplayImage.saveGallaryImg[i]),
                    quality: 60);
              }

              setState(() {
                isSaved = true;
              });
            } else if (nwAT == 'imageTOprev') {
              setState(() {
                isLoading = true;
              });

              await DataBase.addImage().then((value) => {
                    setState(() {
                      isLoading = false;
                      isSaved = true;
                    })
                  });
            } else {
              Navigator.pushReplacementNamed(context, toWhere);
            }
          },
          elevation: 12,
          backgroundColor: Colors.black,
          label: Text(
            isLoading
                ? "\n                 $text2                 \n"
                : isSaved
                    ? "\n                 $text3                 \n"
                    : "\n                 $text                 \n",
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
    );
  }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
