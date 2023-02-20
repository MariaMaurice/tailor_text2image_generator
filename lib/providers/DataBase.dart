import 'dart:convert';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gp/Screens/DisplayImage.dart';
import 'package:gp/providers/AuthService.dart';
import 'package:http/http.dart' as http;
import 'package:gp/providers/HistoryItem.dart';

class DataBase {
  static bool isPrevWork = false;
  static List<Item> history = [];

  static Future<void> addImage() async {
    String email = AuthService.Email!;
    isPrevWork = true;
    final _firebaseStorage = FirebaseStorage.instance;
    //Select Image
    var file = File(DisplayImage.bytes.path);
    var snapshot = await _firebaseStorage
        .ref()
        .child('images/${DateTime.now().microsecondsSinceEpoch}')
        .putFile(file);

    var downloadUrl = await snapshot.ref.getDownloadURL();

    final url =
        'https://tailor-6cc1a-default-rtdb.firebaseio.com/$email/Images.json';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'text': DisplayImage.text,
          'image': downloadUrl,
        }),
      );
      if (history.isNotEmpty) {
        history.add(Item(text: DisplayImage.text, image: downloadUrl));
      }
    } catch (error) {
      print(error);
      throw error;
    }
  }

  static Future<void> getItem() async {
    final url =
        'https://tailor-6cc1a-default-rtdb.firebaseio.com/${AuthService.Email}/Images.json';
    try {
      final response = await http.get(Uri.parse(url));
      print(AuthService.Email);
      print(response.body);
      final extractedData = json.decode(response.body) as Map<dynamic, dynamic>;
      var text, img;
      extractedData.forEach((prodId, prodData) async {
        text = prodData['text'];
        img = prodData['image'];
        history.add(Item(text: text, image: img));
      });
      print(history);
    } catch (error) {}
  }
}
