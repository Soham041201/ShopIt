import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_it/Authentication-Soham/loading.dart';
import 'package:shop_it/Style/text_field_decoration.dart';
import 'package:shop_it/User-Saurav/UserHome.dart';

import 'package:shop_it/User-Saurav/register_user.dart';

class LoginUser extends StatefulWidget {
  const LoginUser({Key? key}) : super(key: key);

  @override
  _LoginUserState createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  bool loading = false;
  String email = '';
  String password = '';
  String error = '';
  final _auth = FirebaseAuth.instance;
  final _fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: loading
          ? Loading()
          : Scaffold(
              backgroundColor: Colors.white12,
              body: Container(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: _fromKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'LOGIN USER PAGE',
                        textScaleFactor: 2,
                        style: TextStyle(color: Colors.white),
                      ),
                      TextFormField(
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w300),
                        decoration: textFieldDecoration('Email'),
                        validator: (val) =>
                            val!.isEmpty ? 'Enter your Email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w300),
                        decoration: textFieldDecoration('Password'),
                        validator: (val) =>
                            val!.isEmpty ? 'Enter your Password' : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CupertinoButton(
                        color: Colors.blue,
                        onPressed: () async {
                          if (_fromKey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                            });

                            dynamic result =
                                await _auth.signInWithEmailAndPassword(
                                    email: email, password: password);

                            if (result != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserHome(),
                                ),
                              );
                            }
                          } else {
                            setState(() {
                              error = 'Check your Email and Password';
                              loading = false;
                            });
                          }
                        },
                        child: Text('Login'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(error),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'OR',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CupertinoButton(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        padding: EdgeInsets.symmetric(horizontal: 60),
                        color: Colors.white,
                        onPressed: () async {
                          setState(() {
                            loading = true;
                          });
                          GoogleSignInAccount? googleUser =
                              await _googleSignIn.signIn();
                          GoogleSignInAuthentication googleAuth =
                              await googleUser!.authentication;
                          // final User user = _auth.
                          loading = false;
                          if (googleAuth.idToken != null) {
                            setState(() {
                              loading = false;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserHome(),
                                ),
                              );
                            });
                          }
                        },
                        child: Container(
                          height: 20,
                          child: Row(
                            children: [
                              Image(
                                image: NetworkImage(
                                  'https://raw.githubusercontent.com/sbis04/flutterfire-samples/google-sign-in/assets/google_logo.png',
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Sign-in with Google',
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                        ), // Suyog change this design
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Not Registerted?',
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Colors.white)),
                      SizedBox(
                        height: 10,
                      ),
                      CupertinoButton(
                        color: Colors.blue,
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterUser(),
                            ),
                          );
                        },
                        child: Text('Register'),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
