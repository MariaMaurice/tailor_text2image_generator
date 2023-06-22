import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../Constants/AppColours.dart';

class Category extends StatefulWidget {
  static String category = '';
  final String name;

  const Category({Key? key, required this.name}) : super(key: key);
  @override
  _Category createState() => _Category(name);
}

class _Category extends State<Category> {
  String name;

  _Category(this.name);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(2.w),
        child: Container(
            decoration: new BoxDecoration(
              border: Border.all(
                  width: 2,
                  color: Category.category == name
                      ? Colors.amber
                      : Colors.black87),
              borderRadius: new BorderRadius.all(Radius.circular(20.0)),
              shape: BoxShape.rectangle,
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Category.category = name;
                    });
                  },
                  child: Stack(alignment: Alignment.bottomCenter, children: [
                    Image(
                      width: 35.w,
                      height: 53.w,
                      image: AssetImage('assets/$name.png'),
                    ),
                    Container(
                      height: 30,
                      width: 35.w,
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
                          title: Text(name,
                              textAlign: TextAlign.center,
                              style: new TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))),
                    ),
                  ]),
                ))));
  }
}
