// Create a home page for the user where he will be able to see the list of items added by seller.

// Hint: Use List view widget to show the list.

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_it/Style/text_field_decoration.dart';
import 'package:shop_it/User-Saurav/login.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Center(
      //           child: Text(
      //         'User Home Page',
      //         textScaleFactor: 2,
      //       )),
      //       CupertinoButton(
      //         child: Text('LOGOUT'),
      //         onPressed: () async {
      //           FirebaseAuth.instance.signOut();
      //           _googleSignIn.signOut();
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => Login(),
      //             ),
      //           );
      //         },
      //         color: Colors.blue,
      //       )
      //     ],
      //   ),
      // ),

      // Appbar starts here

      appBar: AppBar(
        backgroundColor: HexColor('0a1931'),
        title: Center(child: titleTextstyle('ShopIt')),
      ),

      // Appbar ends here

      // Drawer starts

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

      // drawer ends

      // body starts here
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Card(
                  child: Image.asset('assets/images/apple2.png'),
                  elevation: 15,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Popular Categories',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
              Container(
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Card(
                        color: Colors.orange[700],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        elevation: 5,
                        child: Container(
                          height: 200,
                          width: 200,
                          child: Column(
                            children: [
                              Container(
                                height: 200,
                                width: 200,
                                child: Image.asset('assets/images/orange.png'),
                              ),
                              bodyTextstyle(
                                  'Shoes', Colors.white, 24), //Change the font
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Card(
                        color: Colors.red[800],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        elevation: 5,
                        child: Container(
                          height: 200,
                          width: 200,
                          child: Column(
                            children: [
                              Container(
                                height: 200,
                                width: 200,
                                child: Image.asset('assets/images/iphone.png'),
                              ),
                              Text('ELECTRONICS'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Card(
                        color: Colors.lightGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        elevation: 5,
                        child: Container(
                          height: 200,
                          width: 200,
                          child: Column(
                            children: [
                              Container(
                                height: 200,
                                width: 200,
                                child: Image.asset('assets/images/broco.png'),
                              ),
                              Text('GROCERIES'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Card(
                        color: Colors.yellow[700],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        elevation: 5,
                        child: Container(
                          height: 200,
                          width: 200,
                          child: Column(
                            children: [
                              Container(
                                height: 200,
                                width: 200,
                                child: Image.asset('assets/images/yellow.png'),
                              ),
                              Text('FASHION'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),

      // body ends here
    );
  }
}
