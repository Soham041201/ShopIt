import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_it/Authentication-Soham/loading.dart';
import 'package:shop_it/Style/text_field_decoration.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_it/User-Saurav/login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterSellerState createState() => _RegisterSellerState();
}

class _RegisterSellerState extends State<Register>
    with TickerProviderStateMixin {
  String theirGroupValue = 'Buyer';
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );
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
  bool checkbox = true;
  String email = '';
  String password = '';
  String error = '';
  String firstName = '';
  String lastName = '';
  var dob;
  String dropdownValue = '';
  String mobileNumber = '';
  String seller = '';
  String login = '';
  final _auth = FirebaseAuth.instance;
  final _fromKey = GlobalKey<FormState>();
  final _firestore = FirebaseFirestore.instance;

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
                          height: 25,
                        ),

                        titleTextstyle('Register'),
                        SizedBox(
                          height: 20,
                        ),
                        Hero(
                          tag: 'Logo',
                          child: Icon(
                            Icons.shopping_cart_outlined,
                            size: 100,
                            color: Colors.white,
                          ),
                        ),
                        bodyTextstyle(login, Colors.green, 25),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                          validator: (val) =>
                              val!.isEmpty ? 'Enter your Name' : null,
                          onChanged: (val) {
                            setState(() => firstName = val);
                          },
                          decoration:
                              textFieldDecoration('First Name', Icons.person),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                          validator: (val) =>
                              val!.isEmpty ? 'Enter your Surname' : null,
                          onChanged: (val) {
                            setState(() => lastName = val);
                          },
                          decoration:
                              textFieldDecoration('Last Name', Icons.person),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //Change Styling of Calrender from here
                        TextFormField(
                          keyboardType: TextInputType.datetime,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                          validator: (val) =>
                              val!.isEmpty ? 'Enter your Date of Birth' : null,
                          onChanged: (val) {
                            setState(() => dob = val);
                          },
                          decoration: InputDecoration(
                            prefixIcon: GestureDetector(
                              onTap: () => showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1930, 1, 1),
                                  lastDate: DateTime.now()),
                              child: Icon(
                                Icons.calendar_today,
                                color: Colors.white,
                              ),
                            ),
                            fillColor: Colors.white,
                            counterStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w200),
                            labelText: 'DATE OF BIRTH',
                            labelStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w200),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 30.0),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white24, width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.purple, width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                          validator: (val) => val!.length < 10
                              ? 'Enter your Mobile Number'
                              : null,
                          onChanged: (val) {
                            setState(() => mobileNumber = val);
                          },
                          decoration:
                              textFieldDecoration('Mobile Number', Icons.call),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        TextFormField(
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w300,
                                color: Colors.white),
                            validator: (val) =>
                                val!.isEmpty ? 'Enter your Email' : null,
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                            decoration:
                                textFieldDecoration('Email', Icons.email)),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          obscureText: checkbox,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                          validator: (val) =>
                              val!.isEmpty ? 'Enter your Password' : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                          decoration:
                              textFieldDecoration('Password', Icons.password),
                        ),

                        SizedBox(
                          height: 30,
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
                          height: 20,
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
                                    login =
                                        'Your Account has been created successfully.Please login to continue';
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
                                    setState(() {
                                      loading = false;
                                    });
                                    DialogRoute<void>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          SimpleDialog(
                                        title: bodyTextstyle(
                                            'Your Account has been created successfully',
                                            Colors.black,
                                            32),
                                      ),
                                    );
                                  }

                                  print('User Created');
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
