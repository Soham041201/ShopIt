import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_it/User-Saurav/UserHome.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  String email = '';
  String password = '';
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextField(
              decoration: InputDecoration(hintText: 'Email'),
              onChanged: (val) {
                email = val;
              }),
          TextField(
              decoration: InputDecoration(hintText: 'Password'),
              onChanged: (val) {
                password = val;
              }),
          CupertinoButton(
            onPressed: () {
              _auth.createUserWithEmailAndPassword(
                  email: email, password: password);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserHome(),
                ),
              );
            },
            child: Text('Register'),
          )
        ],
      ),
    );
  }
}
