import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_it/Seller-Chinmayee/SellerHome.dart';
import 'package:shop_it/User-Saurav/login_user.dart';




class WrapperSeller extends StatelessWidget {
  const WrapperSeller({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    if(FirebaseAuth.instance.currentUser!=null){
      return SellerHome(firstName: '',);
    }
   return LoginUser();
  }
}
