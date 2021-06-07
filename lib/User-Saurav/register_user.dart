import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_it/User-Saurav/UserHome.dart';
import 'package:shop_it/User-Saurav/login_user.dart';

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
            ),
          SizedBox(height: 20,),


            CupertinoButton(
              
              color: Colors.blue,
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginUser(),
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
