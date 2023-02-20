import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gp/Screens/DisplayImage.dart';
import 'package:gp/providers/AuthService.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:country_picker/country_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:gp/widgets/AppDrawer.dart';
import 'package:gp/widgets/DeafultButton.dart';
import 'package:gp/widgets/TextField.dart';
import '../Constants/AppColours.dart';
import '../widgets/BottomBar.dart';
import '../widgets/Category.dart';
import '../widgets/Logo.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
  static bool isLoading = true;
}

class _HomePage extends State<HomePage> {
  void initState() {
    super.initState();
    DisplayImage.text = '';
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) AuthService.Email = user.uid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomBar(),
        backgroundColor: AppColours.backgroundColor,
        resizeToAvoidBottomInset: true,
        body: Container(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(2.w, 5.h, 2.w, 5.h),
              child: DefultTextField(
                text: "Imagine dress design here...",
                isPassword: false,
                haveicon: false,
                icon: Icons.create,
                maxln: 8,
                nwAT: 'home',
              ),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.w),
                    child: Text(
                      "Choose a style",
                      style: TextStyle(
                        color: AppColours.widgetColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ))),
            Expanded(
                child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  child: Category(name: "Wedding Dress"),
                  width: 53.w,
                ),
                Container(
                  child: Category(name: "Suit"),
                  width: 53.w,
                ),
                Container(
                  child: Category(name: "Wedding Guist Dress"),
                  width: 53.w,
                ),
                Container(
                  child: Category(name: "Casual Dress"),
                  width: 53.w,
                ),
                Container(
                  child: Category(name: "Casual Men Wear"),
                  width: 53.w,
                ),
                Container(
                  child: Category(name: "Casual Women Wear"),
                  width: 53.w,
                ),
              ],
            )),
            SizedBox(height: 2.h),
            DefultButton(
              text: "Submit",
              toWhere: '/image',
              nwAT: 'home',
            ),
          ],
          //),
          // onWillPop: () {
          //   // Widget okButton = FlatButton(
          //   //     child: Text("Yes"),
          //   //     onPressed: () {
          //   //       exit(0);
          //   //     });
          //   // Widget cancelButton = FlatButton(
          //   //     child: Text("cancel"),
          //   //     onPressed: () {
          //   //       Navigator.of(context).pop();
          //   //     });
          //   showDialog(
          //       context: context,
          //       builder: (context) {
          //         return AlertDialog(
          //           shape: RoundedRectangleBorder(
          //               borderRadius: new BorderRadius.circular(15)),
          //           title: Text("Exit"),
          //           content: Text("Are you sure you want to exit?"),
          //           //actions: [okButton, cancelButton],
          //         );
          //       });
          //   Future<bool>? c;
          //   return c!;
          // },
        )));
  }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

//sk-bqvENEQ8pWbLxQy1YUI0w1F10gFK4hvpiwJo1tp6QDy10qsG
