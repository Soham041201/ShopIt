import 'package:flutter/material.dart';
import 'package:shop_it/Style/text_field_decoration.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
import 'User-Saurav/UserHome.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            excludeHeaderSemantics: true,
           
            backgroundColor: Colors.deepPurpleAccent,
            
            //backgroundColor: HexColor('0a1931'),
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90),bottomRight: Radius.circular(30),topLeft:Radius.circular(30) )),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
              ],
            ),
          ),
          
          drawer: Drawer(
            child: Container(
              color: Colors.deepPurpleAccent,
              child: ListView(
                padding: EdgeInsets.only(left: 0,right: 10),
                
                children: [
                  DrawerHeader(
                    child: titleTextstyle('Contents'),
                    padding: EdgeInsets.fromLTRB(15, 120, 0, 0),
                    decoration: BoxDecoration(color: Colors.deepPurpleAccent),
                  ),
                 
                  Container(
                    margin: EdgeInsets.only(left: 10,top: 100),
                    // decoration: BoxDecoration(color: Colors.purple[50]!.withOpacity(0.2),borderRadius: BorderRadius.all(Radius.circular(50))),
                  
                    child: ListTile(
                      
                      leading: Icon(Icons.home),
                        tileColor: Colors.deepPurpleAccent,
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
                  ),
                  SizedBox(height: 5,),
                   Container(
                        margin: EdgeInsets.only(left: 10),
                     child: ListTile(
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
                   ),
                  SizedBox(height: 5,),
                  

                  Container(
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(color: Colors.purple[50]!.withOpacity(0.2),borderRadius: BorderRadius.all(Radius.circular(50))),
                  
                    child: ListTile(
                      
                      leading: Icon(Icons.home),
                        tileColor: Colors.deepPurpleAccent,
                      title: SizedBox(child: bodyTextstyle('Contact Us', Colors.white, 20),width: 20,),
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
                  ),

                ],
              ),
            ),
          ),

    
      backgroundColor: Colors.purple[50],
      body: Center(
        child: Column(
          children: [
            Container(
              height: 350,
              width: 350,
              child: Image.asset('assets/images/support.png'),
            ),
            SizedBox(height: 5,),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Text('We are committed to giving our users and sellers the best experience! Stuck or want help in the workflow? We are ready to help, Contact Us today!', style: TextStyle(color: Colors.black, fontSize: 15),),
          ),
           SizedBox(height: 5,),
          Padding(
            padding: EdgeInsets.only(top: 10, right: 20, left: 20),
            child: Container(
              height: 100,
              child: Card(
                color:Colors.white,
                elevation: 5,
                child: Row(children: [
                  Container(
                    height: 100,
                    child: Icon(Icons.contact_mail, color: Colors.deepPurpleAccent,))
                ],),
              ),
            ),
          ),
          ],
        ),
      ),
    );
  }
}
