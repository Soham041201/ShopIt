// Create a home page for the user where he will be able to add the list of items which will be available to the seller

// Hint: Add a floating button and in the property of onpressed find a method to add the images.abstract

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_it/Seller-Chinmayee/seller_home_page_body.dart';
import 'package:shop_it/Style/text_field_decoration.dart';
import 'package:shop_it/User-Saurav/login.dart';

class SellerHome extends StatefulWidget {
  const SellerHome({Key? key, required this.firstName}) : super(key: key);
  final String firstName;

  @override
  _SellerHomeState createState() => _SellerHomeState();
}

class _SellerHomeState extends State<SellerHome> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor('0a1931'),
          actions: [],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(child: titleTextstyle('ShopIt')),
              bodyTextstyle('Welcome ${widget.firstName}!', Colors.white, 13),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: titleTextstyle('Contents'),
                padding: EdgeInsets.fromLTRB(15, 120, 0, 0),
                decoration: BoxDecoration(color: HexColor('0a1931')),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: bodyTextstyle('Logout', Colors.white, 20),
                onTap: () {
                  setState(() {
                    FirebaseAuth.instance.signOut();
                    GoogleSignIn().signOut();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
                  });
                },
              ),
            ],
          ),
        ),
        body: SellerHomePageBody(),
      ),
    );
  }

  Future<bool> onWillPop() async {
    final shouldPop = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        titleTextStyle: GoogleFonts.montserrat(fontSize: 15),
        title: Text('Are you sure?'),
        contentTextStyle: GoogleFonts.montserrat(fontSize: 20),
        content: Text('Do you want to exit the application?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: bodyTextstyle('No', Colors.blue.shade500, 20),
          ),
          TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Login(),
              ),
            ),
            child: bodyTextstyle('Yes', Colors.blue.shade500, 20),
          ),
        ],
      ),
    );

    return shouldPop ?? false;
  }
}
