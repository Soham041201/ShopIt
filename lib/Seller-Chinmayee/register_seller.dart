import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_it/Authentication-Soham/loading.dart';
import 'package:shop_it/Seller-Chinmayee/SellerHome.dart';
import 'package:shop_it/Seller-Chinmayee/login_seller.dart';
import 'package:shop_it/Style/text_field_decoration.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_it/User-Saurav/login_user.dart';

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
  String mobileNumber = '';
  String seller = '';
  final _auth = FirebaseAuth.instance;
  final _fromKey = GlobalKey<FormState>();
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: loading
          ? Loading()
          : Scaffold(
              backgroundColor: HexColor('0a1931'),
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Form(
                    key: _fromKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        titleTextstyle('Register Seller Page'),
                        SizedBox(
                          height: 65,
                        ),
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
                          height: 10,
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
                          height: 10,
                        ),
                        //Change Styling of Calrender from here
                        TextFormField(
                          keyboardType: TextInputType.datetime,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w300),
                          validator: (val) =>
                              val!.isEmpty ? 'Enter your Date of Birth' : null,
                          onChanged: (val) {
                            setState(() => dob = val);
                          },
                          decoration:
                              textFieldDecoration('Date of birth DD/MM/YYYY'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w300),
                          validator: (val) => val!.length < 10
                              ? 'Enter your Mobile Number'
                              : null,
                          onChanged: (val) {
                            setState(() => lastName = val);
                          },
                          decoration: textFieldDecoration('Mobile Number'),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        TextFormField(
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w300),
                            validator: (val) =>
                                val!.isEmpty ? 'Enter your Email' : null,
                            onChanged: (val) {
                              setState(() => mobileNumber = val);
                            },
                            decoration: textFieldDecoration('Email')),
                        SizedBox(
                          height: 10,
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
                        // CupertinoSlidingSegmentedControl(
                        //     children:List[Seller,Buyer], onValueChanged:(val){

                        //     }),
                        Container(
                          width: 200,
                          child: CupertinoButton(
                              pressedOpacity: 0.1,
                              color: Colors.white,
                              onPressed: () async {
                                if (_fromKey.currentState!.validate()) {
                                  setState(() {
                                    loading = true;
                                  });

                                  dynamic result = await _auth
                                      .createUserWithEmailAndPassword(
                                          email: email, password: password);
                                  if (result != null) {
                                    await _firestore
                                        .collection('Registered Sellers')
                                        .add(
                                      {
                                        'name': firstName,
                                        'lastName': lastName,
                                        'dateOfbirth': dob,
                                        'email': _auth.currentUser!.email,
                                        'mobileNumber': mobileNumber,
                                      },
                                    );
                                    await _firestore.collection('Seller').add({
                                      "Name": firstName,
                                      "device no": '',
                                      "Seller": seller,
                                      "Uid": _auth.currentUser!.uid,
                                      "Role": "user"
                                    });
                                    try {
                                      await _auth.currentUser!
                                          .sendEmailVerification();
                                    } catch (e) {
                                      print(e);
                                    }

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
                                    error = 'Please Enter the required Details';
                                    loading = false;
                                  });
                                }
                              },
                              child: bodyTextstyle(
                                  'Register', HexColor('0a1931'), 18)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        bodyTextstyle('Already Registered ?', Colors.white, 15),
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
                            child: bodyTextstyle(
                                'Login', Colors.blue.shade700, 18))
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
