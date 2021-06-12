import 'package:flutter/material.dart';
import 'package:shop_it/Authentication-Soham/startPage.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('ShopIt',style: TextStyle(
                  fontFamily: 'SourceSansPro', fontWeight: FontWeight.w100,fontSize: 40),)),
      ),
      body: StartPage(),
    );
  }
}
