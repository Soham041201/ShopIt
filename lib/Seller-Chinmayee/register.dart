import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_it/Authentication-Soham/loading.dart';
import 'package:shop_it/Seller-Chinmayee/SellerHome.dart';
import 'package:shop_it/Style/text_field_decoration.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_it/User-Saurav/UserHome.dart';
import 'package:shop_it/User-Saurav/login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterSellerState createState() => _RegisterSellerState();
}

class _RegisterSellerState extends State<Register> {
  String theirGroupValue = 'Buyer';

  final Map<String, Widget> logoWidgets = <String, Widget>{
    'Buyer': Text(
      "Buyer",
      style: GoogleFonts.montserrat(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: Colors.blue.shade700),
    ),
    'Seller': Text(
      "Seller",
      style: GoogleFonts.montserrat(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: Colors.blue.shade700),
    ),
  };
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
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();
  // ignore: unused_element
  static Widget giveCenter(String yourText) {
    return Center(
      child: Text(
        "Text: $yourText",
        style: TextStyle(color: Colors.blue, fontSize: 20.0),
      ),
    );
  }

  List<Widget> bodies = [
    Text("Seller"),
    Text("Buyer"),
  ];
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
                          height: 50,
                        ),
                        titleTextstyle('Register'),
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
                            setState(() => mobileNumber = val);
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
                              setState(() => email = val);
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

                        CupertinoSlidingSegmentedControl(
                          padding: EdgeInsets.symmetric(),
                          groupValue: theirGroupValue,
                          onValueChanged: (changeFromGroupValue) {
                            setState(() {
                              theirGroupValue = changeFromGroupValue.toString();
                            });
                          },
                          children: logoWidgets,
                        ),
                        SizedBox(
                          height: 10,
                        ),
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
                                    await _firestore.collection('Users').add(
                                      {
                                        'name': firstName,
                                        'lastName': lastName,
                                        'dateOfbirth': dob,
                                        'email': _auth.currentUser!.email,
                                        'mobileNumber': mobileNumber,
                                        'type': theirGroupValue
                                      },
                                    );

                                    // var firebaseUser =
                                    //     FirebaseAuth.instance.currentUser;
                                    // FirebaseFirestore.instance
                                    //     .collection("Users")
                                    //     .doc(firebaseUser!.uid)
                                    //     .get()
                                    //     .then((value) {
                                    //   print(value.data()!["name"]);
                                    // });
                                    // StreamBuilder<QuerySnapshot>(
                                    //     stream: _usersStream,
                                    //     builder: (BuildContext context,
                                    //         AsyncSnapshot<QuerySnapshot>
                                    //             snapshot) {
                                    //       if (snapshot.hasError) {
                                    //         return Text("Something went wrong");
                                    //       }

                                    //       if (snapshot.connectionState ==
                                    //           ConnectionState.done) {
                                    //         snapshot.data!.docs.map(
                                    //             (DocumentSnapshot document) {
                                    //           Map<String, dynamic> data =
                                    //               document.data()
                                    //                   as Map<String, dynamic>;
                                    //           print(data);
                                    //           if (data['type'] == 'Buyer') {
                                    //             return UserHome();
                                    //           } else if (data['type'] ==
                                    //               'Seller') {
                                    //             return SellerHome(
                                    //                 firstName: data['name']);
                                    //           }
                                    //           print(data['name']);
                                    //         });
                                    //       }
                                    //       return Register();
                                    //     });
                                    print('User Created');
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
                                  builder: (context) => Login(),
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
