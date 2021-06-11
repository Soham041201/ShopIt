import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_it/Authentication-Soham/loading.dart';
import 'package:shop_it/Style/text_field_decoration.dart';
import 'package:shop_it/User-Saurav/UserHome.dart';
import 'package:shop_it/User-Saurav/login_user.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
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
              body: Container(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: _fromKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'REGISTER USER PAGE',
                        textScaleFactor: 2,
                      ),
                      SizedBox(
                        height: 20,
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
                        decoration: textFieldDecoration('Pasword'),
                        validator: (val) => val!.isEmpty && val.length > 5
                            ? 'Enter your Password'
                            : null,
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
                                await _auth.createUserWithEmailAndPassword(
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
                        child: Text('Register'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(error),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Already Registered?',
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontWeight: FontWeight.w400,
                              fontSize: 20)),
                      SizedBox(
                        height: 10,
                      ),
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
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CupertinoButton(
                        color: Colors.blue,
                        onPressed: () async {
                          setState(() {
                            loading = true;
                          });
                          GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
                          GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
                          // final User user = _auth.
                          loading=false;
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
                        child: Text('Sign-in with Google'),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
