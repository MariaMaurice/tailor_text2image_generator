import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gp/Screens/DisplayImage.dart';
import 'package:gp/providers/DataBase.dart';
import 'package:gp/widgets/DeafultButton.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:country_picker/country_picker.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';
import 'package:gp/Screens/HomePage.dart';
import '../Constants/AppColours.dart';
import '../widgets/BottomBar.dart';
import '../widgets/Logo.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';

class DisplayImage extends StatefulWidget {
  static late Image image;
  static late File bytes;
  static late var saveGallaryImg;
  static var imagePath;
  static String text = '';
  @override
  _DisplayImage createState() => _DisplayImage();
}

class _DisplayImage extends State<DisplayImage> {
  @override
  void initState() {
    HomePage.isLoading = true;
    APIgetter(DisplayImage.text).then((value) {
      setState(() {
        HomePage.isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(),
      backgroundColor: AppColours.backgroundColor,
      resizeToAvoidBottomInset: true,
      body: !HomePage.isLoading
          ? SingleChildScrollView(
              child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.fromLTRB(2.w, 3.h, 2.w, 3.h),
                    child: FullScreenWidget(child: DisplayImage.image)),
                SizedBox(height: 2.h),
                DefultButton(
                  text: "Save to gallery",
                  nwAT: 'imageTogallery',
                  toWhere: '',
                ),
                DefultButton(
                  text: "Save to your previous work",
                  nwAT: 'imageTOprev',
                  toWhere: '/prevWork',
                ),
              ],
            ))
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

Future<void> APIgetter(String text) async {
  const baseUrl = 'https://api.stability.ai';
  final url = Uri.parse(
      '$baseUrl/v1alpha/generation/stable-diffusion-512-v2-0/text-to-image');

  // Make the HTTP POST request to the Stability Platform API
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'sk-bqvENEQ8pWbLxQy1YUI0w1F10gFK4hvpiwJo1tp6QDy10qsG',
      'Accept': 'image/png',
    },
    body: jsonEncode({
      'cfg_scale': 7,
      'clip_guidance_preset': 'FAST_BLUE',
      'height': 512,
      'width': 512,
      'samples': 1,
      'steps': 50,
      'text_prompts': [
        {
          'text': text ?? '',
          'weight': 1,
        }
      ],
    }),
  );

  if (response.statusCode != 200) {
    print('Failed to generate image');
  } else {
    try {
      print(response.bodyBytes);
      DisplayImage.image = Image.memory(response.bodyBytes);
      //DisplayImage.bytes = response.bodyBytes;

      final documentDirectory = await getApplicationDocumentsDirectory();
      DisplayImage.imagePath = await File(
              '${documentDirectory.path}/${DateTime.now().microsecondsSinceEpoch}.png')
          .create();
      DisplayImage.bytes =
          await DisplayImage.imagePath.writeAsBytes(response.bodyBytes);
      DisplayImage.saveGallaryImg = response.bodyBytes;
    } on Exception catch (e) {
      print('Failed to generate image');
    }
  }

  // var request = http.Request(
  //     'GET',
  //     Uri.parse(
  //         'https://api.newnative.ai/stable-diffusion?prompt=futuristic spce station,'
  //         ' 4k digital art'));
  // try {
  //   http.StreamedResponse response = await request.send();
  //   print(response.stream.bytesToString());
  // } catch (error) {
  //   print(error);
  //   throw error;
  // }

  //List<UploadTask> _uploadTasks = [];
  // Future<UploadTask?> uploadFile(File? file) async {
  //   if (file == null) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text('No file was selected'),
  //       ),
  //     );
  //
  //     return null;
  //   }
  //
  //   UploadTask uploadTask;
  //
  //   // Create a Reference to the file
  //   Reference ref = FirebaseStorage.instance
  //       .ref()
  //       .child('flutter-tests')
  //       .child('/some-image.jpg');
  //
  //   final metadata = SettableMetadata(
  //     contentType: 'image/jpeg',
  //     customMetadata: {'picked-file-path': file.path},
  //   );
  //
  //   uploadTask = ref.putFile(io.File(file.path), metadata);
  //
  //   return Future.value(uploadTask);
  // }
}
