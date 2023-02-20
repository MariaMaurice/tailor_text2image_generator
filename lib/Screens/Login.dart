import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gp/Screens/SplachScreen.dart';
import 'package:gp/providers/AuthService.dart';
import 'package:gp/widgets/DeafultButton.dart';
import 'package:gp/widgets/TextField.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:country_picker/country_picker.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';
import 'package:sizer/sizer.dart';
import '../Constants/AppColours.dart';
import '../widgets/Logo.dart';

class Login extends StatefulWidget {
  static bool isForget = false;
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  TextEditingController phoneController = TextEditingController();
  String? id, password, name;
  String countrycode = "+20";
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        print('User is signed in!');
        Navigator.pushReplacementNamed(context, '/Home');
      }
    });
    setState(() {
      Login.isForget = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColours.backgroundColor,
        resizeToAvoidBottomInset: true,
        body: WillPopScope(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(1.w, 1.w, 1.w, 1.w),
                    child: Logo(),
                  ),
                  // DefultTextField(
                  //   text: "Phone Number",
                  //   isPassword: false,
                  //   haveicon: true,
                  //   icon: Icons.phone,
                  //   maxln: 1,
                  //   nwAT: 'login',
                  // ),
                  // DefultTextField(
                  //   text: "Enter your password",
                  //   isPassword: true,
                  //   haveicon: true,
                  //   icon: Icons.vpn_key_outlined,
                  //   maxln: 1,
                  //   nwAT: 'login',
                  // ),
                  SignInButton(
                    buttonSize: ButtonSize.large,
                    buttonType: ButtonType.google,
                    onPressed: () async {
                      try {
                        await AuthService().signInWithGoogle();
                        Navigator.pushReplacementNamed(context, '/Home');
                      } catch (e) {
                        if (e is FirebaseAuthException) {
                          print(e.message!);
                        }
                      }
                    },
                  ),
                  // SignInButton(
                  //   buttonType: ButtonType.facebook,
                  //   onPressed: () {
                  //     Navigator.pushReplacementNamed(context, '/Home');
                  //   },
                  // ),
                  // Align(
                  //   alignment: Alignment.topLeft,
                  //   child: Padding(
                  //     padding:
                  //         EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.w),
                  //     child: TextButton(
                  //       onPressed: () {
                  //         setState(() {});
                  //         //Navigator.of(context).pushNamed('/registration');
                  //       },
                  //       child: Text(
                  //         "Forgot Password?",
                  //         style: TextStyle(
                  //             color: AppColours.widgetColor,
                  //             fontSize: 14.sp,
                  //             fontWeight: FontWeight.bold),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Align(
                  //     alignment: Alignment.topLeft,
                  //     child: Padding(
                  //         padding: EdgeInsets.symmetric(
                  //             horizontal: 2.w, vertical: 1.w),
                  //         child: Row(
                  //           children: [
                  //             SizedBox(
                  //               width: 2.w,
                  //             ),
                  //             Text(
                  //               "do you have account",
                  //               style: TextStyle(
                  //                 color: AppColours.widgetColor,
                  //                 fontSize: 14.sp,
                  //               ),
                  //             ),
                  //             TextButton(
                  //               onPressed: () {
                  //                 setState(() {});
                  //                 Navigator.of(context)
                  //                     .pushNamed('/registration');
                  //               },
                  //               child: Text(
                  //                 "Sign up?",
                  //                 style: TextStyle(
                  //                     color: AppColours.widgetColor,
                  //                     fontSize: 14.sp,
                  //                     fontWeight: FontWeight.bold),
                  //               ),
                  //             ),
                  //           ],
                  //         ))),
                  SizedBox(height: 7.h),
                ],
              ),
            ),
          ),
          onWillPop: () {
            // Widget okButton = FlatButton(
            //     child: Text("Yes"),
            //     onPressed: () {
            //       exit(0);
            //     });
            // Widget cancelButton = FlatButton(
            //     child: Text("cancel"),
            //     onPressed: () {
            //       Navigator.of(context).pop();
            //     });
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15)),
                    title: Text("Exit"),
                    content: Text("Are you sure you want to exit?"),
                    //actions: [okButton, cancelButton],
                  );
                });
            Future<bool>? c;
            return c!;
          },
        ));
  }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
