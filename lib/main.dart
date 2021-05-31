
// PLEASE DONT TOUCH THIS FILE TO MAKE THE CHANGES

import 'package:flutter/material.dart';
import 'home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        fontFamily: 'SourceSansPro' // Use any font you want to use just add the same here to make it default. 
      ),
        home: Home() );
  }
}
//How to add the fonts
//download the font family file form google fonts
//extract the file
//copy the contents into fonts file in the project
//head over to pubspec.yaml file  