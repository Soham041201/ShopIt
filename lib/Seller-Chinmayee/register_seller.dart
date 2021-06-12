import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_it/Authentication-Soham/loading.dart';
import 'package:shop_it/Seller-Chinmayee/SellerHome.dart';
import 'package:shop_it/Seller-Chinmayee/login_seller.dart';
import 'package:shop_it/Style/text_field_decoration.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class RegisterSeller extends StatefulWidget {
  const RegisterSeller({Key? key}) : super(key: key);

  @override
  _RegisterSellerState createState() => _RegisterSellerState();
}

class _RegisterSellerState extends State<RegisterSeller> {
  bool loading = false;
  String email = '';
  String password = '';
  String error = '';
  String firstName = '';
  String lastName = '';
  var dob;
  String dropdownValue = '';

  final _auth = FirebaseAuth.instance;
  final _fromKey = GlobalKey<FormState>();
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: loading
          ? Loading()
          : Scaffold(
              appBar: AppBar(
                title: Text(
                  'REGISTER SELLER PAGE',
                  textScaleFactor: 1,
                  style: TextStyle(
                      fontFamily: 'SourceSansPro', fontWeight: FontWeight.w300),
                ),
                backgroundColor: Colors.blue.withOpacity(0.2),
                toolbarOpacity: 1,
                centerTitle: true,
                leading: GestureDetector(
                  child: Icon(Icons.home),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Form(
                    key: _fromKey,
                    child: Column(
                      children: [
                        TextFormField(
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w300),
                          validator: (val) =>
                              val!.isEmpty ? 'Enter your Name' : null,
                          onChanged: (val) {
                            setState(() => firstName = val);
                          },
                          decoration: textFieldDecoration('First Name'),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w300),
                          validator: (val) =>
                              val!.isEmpty ? 'Enter your Surname' : null,
                          onChanged: (val) {
                            setState(() => lastName = val);
                          },
                          decoration: textFieldDecoration('Last Name'),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        //Change Styling of Calrender from here
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'ENTER YOUR DATE OF BIRTH',
                                style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.blue,
                                ),
                              ),
                              CupertinoButton(
                                onPressed: () {
                                  DatePicker.showDatePicker(
                                    context,
                                    showTitleActions: true,
                                    minTime: DateTime(1930, 1, 1),
                                    maxTime: DateTime.now(),
                                    onChanged: (date) {
                                      dob = date;
                                    },
                                    onConfirm: (date) {
                                      dob = date;
                                    },
                                  );
                                },
                                child: Icon(Icons.calendar_today),
                              ),
                            ],
                          ),
                        ),
                        // TextFormField(
                        //   keyboardType: TextInputType.datetime,
                        //   textAlign: TextAlign.center,
                        //   style: TextStyle(
                        //       fontSize: 20.0, fontWeight: FontWeight.w300),
                        //   validator: (val) =>
                        //       val!.isEmpty ? 'Enter your Date of Birth' : null,
                        //   onChanged: (val) {
                        //     setState(() => dob = val);
                        //   },
                        //   decoration:
                        //       textFieldDecoration('Date of birth DD/MM/YYYY'),
                        // ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w300),
                            validator: (val) =>
                                val!.isEmpty ? 'Enter your Email' : null,
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                            decoration: textFieldDecoration('Email')),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          obscureText: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w300),
                          validator: (val) =>
                              val!.isEmpty ? 'Enter your Password' : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                          decoration: textFieldDecoration('Password'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CupertinoButton(
                          pressedOpacity: 0.1,
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
                                _firestore.collection('user_data').add(
                                  {
                                    'name': firstName,
                                    'lastName': lastName,
                                    'dateOfbirth': dob,
                                    'email': _auth.currentUser!.email
                                  },
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SellerHome(
                                      firstName: firstName,
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
                          child: Text('Register'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(error),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Already Registered?',
                            style: TextStyle(
                                fontFamily: 'SourceSansPro',
                                fontWeight: FontWeight.w400,
                                fontSize: 20)),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginSeller(),
                              ),
                            );
                          },
                          child: Text('Login',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: 'SourceSansPro',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
