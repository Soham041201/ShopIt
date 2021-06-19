import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_it/Authentication-Soham/startPage.dart';
import 'package:shop_it/Seller-Chinmayee/SellerHome.dart';
import 'package:shop_it/User-Saurav/UserHome.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      try {
        FirebaseFirestore.instance
            .collection('Users')
            .get()
            .then((querySnapshot) {
          querySnapshot.docs.forEach((element) {
            if (element['type'] == 'Buyer') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserHome(),
                ),
              );
            } else if (element['type'] == 'Seller') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SellerHome(firstName: element['name']),
                ),
              );
            }
          });
        });
      } catch (e) {
        print(e.toString());
      }
    }
    if (GoogleSignIn().currentUser != null) {
      return UserHome();
    }
    return StartPage();
  }
}
