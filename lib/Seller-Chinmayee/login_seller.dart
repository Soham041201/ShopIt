import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_it/Authentication-Soham/loading.dart';
import 'package:shop_it/Seller-Chinmayee/SellerHome.dart';
import 'package:shop_it/Seller-Chinmayee/register_seller.dart';
import 'package:shop_it/Style/text_field_decoration.dart';

class LoginSeller extends StatefulWidget {
  const LoginSeller({Key? key}) : super(key: key);

  @override
  _LoginSellerState createState() => _LoginSellerState();
}

class _LoginSellerState extends State<LoginSeller> {
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
              backgroundColor: Colors.black,
              body: Container(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: _fromKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'LOGIN SELLER PAGE',
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
                                  builder: (context) => SellerHome(
                                    firstName: '',
                                  ),
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
                      Text(
                        error,
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 20,
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
                              builder: (context) => RegisterSeller(),
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
