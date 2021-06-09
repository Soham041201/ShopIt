import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_it/Seller-Chinmayee/SellerHome.dart';
import 'package:shop_it/Seller-Chinmayee/register_seller.dart';

import 'package:shop_it/User-Saurav/register_user.dart';


class WrapperUser extends StatelessWidget {
  const WrapperUser({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    if(FirebaseAuth.instance.currentUser!=null){
      return SellerHome();
    }
   return RegisterSeller();
  }
}