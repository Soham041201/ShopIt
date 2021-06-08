// Create a home page for the user where he will be able to see the list of items added by seller.

// Hint: Use List view widget to show the list.
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_it/User-Saurav/register_user.dart';
class UserHome extends StatefulWidget {
  const UserHome({ Key? key }) : super(key: key);

  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('User Home Page',textScaleFactor: 2,)),
            CupertinoButton(child: Text('LOGOUT'), onPressed: ()async {FirebaseAuth.instance.signOut();Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterUser(),
                      ),
                    );},color: Colors.blue,)
          ],
        ),
      ),
    );
  }
}