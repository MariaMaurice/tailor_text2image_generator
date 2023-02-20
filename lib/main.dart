import 'package:gp/Screens/DisplayImage.dart';
import 'package:gp/Screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:gp/Screens/PervWork.dart';
import 'package:sizer/sizer.dart';
import 'Screens/Login.dart';
import 'Screens/SignUp.dart';
import 'Screens/SplachScreen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {
            '/': (context) => Starting(),
            '/Login': (context) => Login(),
            '/Home': (context) => HomePage(),
            '/registration': (context) => SignUp(),
            '/image': (context) => DisplayImage(),
            '/prevWork': (context) => PrevWork(),
          });
    });
  }
}
