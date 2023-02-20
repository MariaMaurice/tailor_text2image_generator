import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../Constants/AppColours.dart';

class Category extends StatelessWidget {
  static String category = '';
  final String name;
  const Category({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(2.w),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              GestureDetector(
                  onTap: () {
                    if (name == "wedding")
                      category = "Wedding Dress";
                    else if (name == "suit")
                      category = "Suit";
                    else if (name == "guest")
                      category = "Wedding Guist Dress";
                    else if (name == "casual")
                      category = "Casual Dress";
                    else if (name == "casualMen")
                      category = "Casual Men Wear";
                    else if (name == "causalwomen")
                      category = "Casual Women Wear";
                    //Navigator.pop(context);
                  },
                  child: Image(
                    image: AssetImage('assets/$name.png'),
                  )),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                      height: 50,
                      width: 50.w,
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
                      child: Text(name,
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)))),
            ],
          ),
        ));
  }
}
