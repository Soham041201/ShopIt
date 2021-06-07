import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_it/User-Saurav/UserHome.dart';

class LoginUser extends StatefulWidget {
  const LoginUser({Key? key}) : super(key: key);

  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<LoginUser> {
  String email = '';
  String password = '';
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                textAlign: TextAlign.center,
                  decoration: InputDecoration(hintText: 'Email'),
                  onChanged: (val) {
                    email = val;
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                style: TextStyle(),
                  decoration: InputDecoration(hintText: 'Password'),
                  onChanged: (val) {
                    password = val;
                  }),
            ),
            CupertinoButton(
              
              color: Colors.blue,
              onPressed: () async {
                _auth.signInWithEmailAndPassword(email: email, password: password);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserHome(),
                  ),
                );
              },
              child: Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}
