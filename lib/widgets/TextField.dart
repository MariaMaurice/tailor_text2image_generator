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
            style: TextStyle(color: AppColours.textColor),
            maxLines: maxln,
            decoration: InputDecoration(
              fillColor: AppColours.widgetColor,
              hintText: text,
              hintStyle:
                  TextStyle(color: AppColours.textColor, fontSize: 15.sp),
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 5, color: AppColours.color),
                borderRadius: BorderRadius.circular(10.0),
              ),
            )),
      ),
    );
  }
}
