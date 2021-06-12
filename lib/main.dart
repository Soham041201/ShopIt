// PLEASE DONT TOUCH THIS FILE TO MAKE THE CHANGES

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        theme: ThemeData.dark().copyWith(
        primaryColorDark: Colors.black,
        backgroundColor: Colors.black87,
            textTheme: TextTheme(
              button:  TextStyle(
                  fontFamily: 'SourceSansPro', fontWeight: FontWeight.bold,color: Colors.white),
              headline5: TextStyle(
                  fontFamily: 'SourceSansPro', fontWeight: FontWeight.bold,color: Colors.white),
              headline1: TextStyle(
                  fontFamily: 'SourceSansPro', fontWeight: FontWeight.bold,color: Colors.white),
              bodyText2: TextStyle(
                  fontFamily: 'SourceSansPro', fontWeight: FontWeight.w300,color: Colors.white),
            ),
           
            primaryColor: Colors.black,
            scaffoldBackgroundColor: Colors.black,
            // Use any font you want to use just add the same here to make it default.
            ),
        home: Home());
  }
}
//How to add the fonts
//download the font family file form google fonts
//extract the file
//copy the contents into fonts file in the project
//head over to pubspec.yaml file
