// Create a home page for the user where he will be able to see the list of items added by seller.

// Hint: Use List view widget to show the list

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_it/Style/text_field_decoration.dart';
import 'package:shop_it/User-Saurav/login.dart';
import 'package:shop_it/contact_us.dart';
import 'card_product.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key, required this.firstname}) : super(key: key);
  final String firstname;
  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          backgroundColor: Colors.white,

          // Appbar starts here

          appBar: AppBar(
            backgroundColor: HexColor('0a1931'),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(child: titleTextstyle('ShopIt')),
                bodyTextstyle('Welcome, ${widget.firstname}', Colors.white, 10),
              ],
            ),
          ),

          // Appbar ends here

          // Drawer starts

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
                  
                  leading: Icon(Icons.home),
                    tileColor: Colors.blueAccent,
                  title: SizedBox(child: bodyTextstyle('Home', Colors.white, 20),width: 20,),
                  onTap: () {
                    setState(() {
                      FirebaseAuth.instance.signOut();
                      GoogleSignIn().signOut();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserHome(firstname: ''),
                        ),
                      );
                    });
                  },
                ),
                SizedBox(height: 5,),
                 ListTile(
                     tileColor: Colors.blueAccent,
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
                SizedBox(height: 5,),
                ListTile(
                    tileColor: Colors.blueAccent,
                    
                  leading: Icon(Icons.contact_phone),
                  title: bodyTextstyle('Contact Us', Colors.white, 20),
                  onTap: () {
                    setState(() {
                      FirebaseAuth.instance.signOut();
                      GoogleSignIn().signOut();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContactUs(),
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
                      child:
                          bodyTextstyle('Popular Choices', Colors.black, 28)),
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
                                    child:
                                        Image.asset('assets/images/orange.png'),
                                  ),
                                  bodyTextstyle('Shoes', Colors.white,
                                      24), //Change the font
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
                                    child:
                                        Image.asset('assets/images/iphone.png'),
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
                                    child:
                                        Image.asset('assets/images/broco.png'),
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
                                    child:
                                        Image.asset('assets/images/yellow.png'),
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
                bodyTextstyle('Recently Added',Colors.purple, 26),
                  StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Products')
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            return SizedBox(
              height: 300,
              child: ListView.builder(
           
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return ProductCard(snapshot.data!.docs[index]['imagelink'],snapshot.data!.docs[index]['productName'],snapshot.data!.docs[index]['productCost']);
                  }),
            );
          }),
            bodyTextstyle('©VIT PUNE Q DIV GROUP 5', Colors.grey, 10),
              Center(child: bodyTextstyle('Made by Soham , Suyog, Chinmayee, Saumeen, Saurav ', Colors.grey, 10)),
              SizedBox(height: 20,),    
                ],
              ),
            ],
          ),
        )
        // body ends here

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
            onPressed: () => Navigator.of(context).pop(true),
            child: bodyTextstyle('Yes', Colors.blue.shade500, 20),
          ),
        ],
      ),
    );

    return shouldPop ?? false;
  }
}
