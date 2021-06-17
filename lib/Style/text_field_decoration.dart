import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

InputDecoration textFieldDecoration(String hintText, IconData icon) {
  return InputDecoration(
    prefixIcon: Icon(
      icon,
      color: Colors.white,
    ),
    fillColor: Colors.white,
    counterStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
    labelText: hintText,
    labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white24, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.purple, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
  );
}

Text titleTextstyle(String text) {
  return Text(text,
      style: GoogleFonts.hammersmithOne(fontSize: 30, color: Colors.white));
}

Text bodyTextstyle(String text, Color color, double fontSize) {
  return Text(text,
      style: GoogleFonts.montserrat(
          fontSize: fontSize, fontWeight: FontWeight.normal, color: color));
}
