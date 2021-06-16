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
              backgroundColor: HexColor('0a1931'),
              body: Container(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: _fromKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 40),
                        titleTextstyle('LOGIN AS USER'),
                        SizedBox(height: 150),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red),
                        ),
                        SizedBox(
                          height: 10,
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
                          height: 10,
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
                        Container(
                          width: 300,
                          child: CupertinoButton(
                              color: Colors.white,
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
                              child: bodyTextstyle('Login', Colors.black, 20)),
                        ),
                        SizedBox(height: 20),

                        SizedBox(
                          height: 10,
                        ),
                        bodyTextstyle('Or Sign-up Using', Colors.white, 20),
                        SizedBox(
                          height: 10,
                        ),
                        IconButton(
                          focusColor: Colors.white,
                          disabledColor: Colors.white,
                          splashColor: Colors.white,
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
                          icon: Image(
                            image: NetworkImage(
                              'https://raw.githubusercontent.com/sbis04/flutterfire-samples/google-sign-in/assets/google_logo.png',
                            ),
                          ),
                        ),
                        //Add Icons for facebook
                        SizedBox(
                          height: 150,
                        ),
                        bodyTextstyle('Not Registered Yet?', Colors.white, 20),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          child: bodyTextstyle(
                            'Register Now!',
                            Colors.white,
                            15,
                          ),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterUser(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
