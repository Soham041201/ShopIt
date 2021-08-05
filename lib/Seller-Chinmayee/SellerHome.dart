import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_it/Seller-Chinmayee/products.dart';
import 'package:shop_it/Seller-Chinmayee/seller_home_page_body.dart';
import 'package:shop_it/Seller-Chinmayee/shop_details.dart';
import 'package:shop_it/Style/text_field_decoration.dart';
import 'package:shop_it/User-Saurav/login.dart';
import 'package:shop_it/contact_us.dart';

import 'add_items.dart';

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
          backgroundColor: Colors.purple[50],
        appBar: AppBar(
                 backgroundColor: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90),bottomRight: Radius.circular(30),topLeft:Radius.circular(30) )),
          actions: [],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(child: titleTextstyle('ShopIt')),
              bodyTextstyle('Welcome ${widget.firstName}!', Colors.white, 13),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
        backgroundColor: HexColor('0a1931'),
        elevation: 0.1,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddItems()),
          );
        },
      ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(5),
            children: [
              DrawerHeader(
                child: titleTextstyle('Contents'),
                padding: EdgeInsets.fromLTRB(15, 120, 0, 0),
                decoration: BoxDecoration(color: HexColor('0a1931')),
              ),
              ListTile(
                tileColor: Colors.blueAccent,
                leading: Icon(Icons.logout,color: Colors.white),
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
              SizedBox(height: 5,),
            ListTile(
              tileColor: Colors.blueAccent,
                leading: Icon(Icons.app_registration,color: Colors.white),
                title: bodyTextstyle('Complete your registration', Colors.white, 20),
                onTap: () {
                  setState(() {
                   Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ShopDetails()),
                    );
                     
                  });
                },
              ), 
              SizedBox(height: 5,),
               ListTile(
              
              tileColor: Colors.blueAccent,
                leading: Icon(Icons.contact_phone,color: Colors.white),
                title: bodyTextstyle('Contact Us', Colors.white, 20),
                onTap: () {
                  setState(() {
                   Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ContactUs()),
                    );
                     
                  });
                },
              ),   
            ],
          ),
        ),
        // body: Products(),
        body: Products(),
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
            onPressed: () {
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
            child: bodyTextstyle('Yes', Colors.blue.shade500, 20),
          ),
        ],
      ),
    );

    return shouldPop ?? false;
  }

}
