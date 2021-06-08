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
  final _fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Form(
          key: _fromKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                  style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500) ,
                  decoration: InputDecoration(hintText: 'Email'),
                  validator: (val) => val!.isEmpty ? 'Enter your Email':null ,
                  onChanged: (val){
                    setState(()=>email=val);
                  },
                ),
             TextFormField(
                  style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500) ,
                  decoration: InputDecoration(hintText: 'Password'),
                  validator: (val) => val!.isEmpty ? 'Enter your Password':null ,
                  onChanged: (val){
                    setState(()=>password=val);
                  },
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
      ),
    );
  }
}
