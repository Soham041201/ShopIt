// Create a home page for the user where he will be able to add the list of items which will be available to the seller

// Hint: Add a floating button and in the property of onpressed find a method to add the images.abstract
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_it/Seller-Chinmayee/register_seller.dart';
class SellerHome extends StatefulWidget {
  const SellerHome({ Key? key }) : super(key: key);

  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<SellerHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('Seller Home Page',textScaleFactor: 2,)),
            CupertinoButton(child: Text('LOGOUT'), onPressed: ()async {FirebaseAuth.instance.signOut();Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterSeller(),
                      ),
                    );},color: Colors.blue,)
          ],
        ),
      ),
    );
  }
}