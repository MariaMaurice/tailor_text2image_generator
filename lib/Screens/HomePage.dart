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
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(2.w, 7.h, 2.w, 3.h),
                  child: DefultTextField(
                    text: "Imagine a dress design here...",
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 1.w),
                        child: Text(
                          "Choose a style",
                          style: TextStyle(
                            color: AppColours.textColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ))),
                Container(
                    height: 53.w,
                    child:
                        ListView(scrollDirection: Axis.horizontal, children: [
                      Padding(
                          padding: EdgeInsets.all(2.w),
                          child: Container(
                              decoration: new BoxDecoration(
                                border: Border.all(
                                    width: 3,
                                    color: Category.category == "General"
                                        ? Colors.amber
                                        : Colors.black87),
                                borderRadius:
                                    new BorderRadius.all(Radius.circular(20.0)),
                                shape: BoxShape.rectangle,
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        Category.category = "General";
                                      });
                                    },
                                    child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          Image(
                                            width: 150,
                                            height: 250,
                                            image: AssetImage(
                                                'assets/General.jpg'),
                                          ),
                                          Container(
                                            width: 150,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              color: Colors.black87,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black26,
                                                  offset: Offset(0.0, 2.0),
                                                  blurRadius: 20.0,
                                                ),
                                              ],
                                            ),
                                            child: GridTileBar(
                                                title: Text("Genral",
                                                    textAlign: TextAlign.center,
                                                    style: new TextStyle(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white))),
                                          ),
                                        ]),
                                  )))),
                      Padding(
                          padding: EdgeInsets.all(2.w),
                          child: Container(
                              decoration: new BoxDecoration(
                                border: Border.all(
                                    width: 3,
                                    color: Category.category == "Wedding Dress"
                                        ? Colors.amber
                                        : Colors.black87),
                                borderRadius:
                                    new BorderRadius.all(Radius.circular(20.0)),
                                shape: BoxShape.rectangle,
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        Category.category = "Wedding Dress";
                                      });
                                    },
                                    child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          Image(
                                            width: 150,
                                            height: 250,
                                            image: AssetImage(
                                                'assets/Wedding Dress.png'),
                                          ),
                                          Container(
                                            height: 30,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              color: Colors.black87,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black26,
                                                  offset: Offset(0.0, 2.0),
                                                  blurRadius: 20.0,
                                                ),
                                              ],
                                            ),
                                            child: GridTileBar(
                                                title: Text("Wedding Dress",
                                                    textAlign: TextAlign.center,
                                                    style: new TextStyle(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white))),
                                          ),
                                        ]),
                                  )))),
                      Padding(
                          padding: EdgeInsets.all(2.w),
                          child: Container(
                              decoration: new BoxDecoration(
                                border: Border.all(
                                    width: 3,
                                    color: Category.category == "Casual"
                                        ? Colors.amber
                                        : Colors.black87),
                                borderRadius:
                                    new BorderRadius.all(Radius.circular(20.0)),
                                shape: BoxShape.rectangle,
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        Category.category = "Casual";
                                      });
                                    },
                                    child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          Image(
                                            width: 150,
                                            height: 250,
                                            image:
                                                AssetImage('assets/Casual.png'),
                                          ),
                                          Container(
                                            height: 30,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              color: Colors.black87,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black26,
                                                  offset: Offset(0.0, 2.0),
                                                  blurRadius: 20.0,
                                                ),
                                              ],
                                            ),
                                            child: GridTileBar(
                                                title: Text("Casual",
                                                    textAlign: TextAlign.center,
                                                    style: new TextStyle(
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white))),
                                          ),
                                        ]),
                                  )))),
                    ])),

                // SingleChildScrollView(
                //     scrollDirection: Axis.horizontal,
                //     child: Row(
                //       children: [
                //         Category(name: "Wedding Dress"),
                //         Category(name: "Casual Women Wear"),
                //
                //         // Container(
                //         //   child: Category(name: "Suit"),
                //         //   width: 53.w,
                //         // ),
                //         // Container(
                //         //   child: Category(name: "Wedding Guist Dress"),
                //         //   width: 53.w,
                //         // ),
                //         // Container(
                //         //   child: Category(name: "Casual Dress"),
                //         //   width: 53.w,
                //         // ),
                //         // Container(
                //         //   child: Category(name: "Casual Men Wear"),
                //         //   width: 53.w,
                //         // ),
                //       ],
                //     )),
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
