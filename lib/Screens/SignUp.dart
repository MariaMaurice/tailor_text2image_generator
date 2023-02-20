import 'dart:convert';
import 'dart:io';
import 'package:gp/Screens/SplachScreen.dart';
import 'package:gp/widgets/DeafultButton.dart';
import 'package:gp/widgets/TextField.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:country_picker/country_picker.dart';
import 'package:sizer/sizer.dart';
import '../Constants/AppColours.dart';
import '../widgets/Logo.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUp createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  TextEditingController phoneController = TextEditingController();
  String? id, password, name;
  String countrycode = "+20";

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
                  DefultTextField(
                    text: "Phone Number",
                    isPassword: false,
                    haveicon: true,
                    icon: Icons.phone,
                    maxln: 1,
                    nwAT: 'signup',
                  ),
                  DefultTextField(
                    text: "Enter your password",
                    isPassword: true,
                    haveicon: true,
                    icon: Icons.vpn_key_outlined,
                    maxln: 1,
                    nwAT: 'signup',
                  ),
                  DefultTextField(
                    text: "Renter your password",
                    isPassword: true,
                    haveicon: true,
                    icon: Icons.vpn_key_outlined,
                    maxln: 1,
                    nwAT: 'signup',
                  ),
                  DefultButton(
                      text: 'Sign Up', toWhere: '/Home', nwAT: 'signup'),
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
