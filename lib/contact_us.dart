import 'package:flutter/material.dart';
import 'package:shop_it/Style/text_field_decoration.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      backgroundColor: Colors.white,
      body: Center(child: bodyTextstyle('Contact Us Page',Colors.blue,28)),
    );
  }
}
