import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 5.h,
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.black),
            title: Text('Log Out'),
            onTap: () {
              Navigator.of(context).pushNamed('/Login');
            },
          ),
        ],
      ),
    );
  }
}
