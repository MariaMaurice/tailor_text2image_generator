import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Constants/AppColours.dart';
import '../Screens/DisplayImage.dart';

class DefultTextField extends StatefulWidget {
  final String text;
  final bool isPassword;
  final bool haveicon;
  final IconData icon;
  final int maxln;
  final String nwAT;
  const DefultTextField(
      {Key? key,
      required this.text,
      required this.isPassword,
      required this.haveicon,
      required this.icon,
      required this.maxln,
      required this.nwAT})
      : super(key: key);
  @override
  _DefultTextField createState() =>
      _DefultTextField(text, isPassword, haveicon, icon, maxln, nwAT);
}

class _DefultTextField extends State<DefultTextField> {
  String text;
  String nwAT;
  bool isPassword;
  bool haveicon;
  IconData icon;
  int maxln;
  _DefultTextField(this.text, this.isPassword, this.haveicon, this.icon,
      this.maxln, this.nwAT);
  bool isHide = false;
  @override
  void initState() {
    super.initState();
    isHide = !isPassword ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 3.w),
        child: TextField(
            onChanged: (value) {
              setState(() {
                DisplayImage.text = value;
              });
            },
            style: TextStyle(color: AppColours.backgroundColor),
            maxLines: maxln,
            cursorColor: AppColours.backgroundColor,
            obscureText: isHide ? false : true,
            decoration: InputDecoration(
              fillColor: AppColours.widgetColor,
              prefixIcon: haveicon
                  ? Icon(
                      icon,
                      color: AppColours.backgroundColor,
                    )
                  : SizedBox(),
              suffixIcon: isPassword
                  ? IconButton(
                      color: AppColours.backgroundColor,
                      icon: Icon(!isHide
                          ? Icons.visibility_off
                          : Icons.remove_red_eye),
                      onPressed: () {
                        setState(() {
                          isHide = !isHide;
                        });
                      })
                  : SizedBox(),
              hintText: text,
              hintStyle:
                  TextStyle(color: AppColours.backgroundColor, fontSize: 18),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            )),
      ),
    );
  }
}
