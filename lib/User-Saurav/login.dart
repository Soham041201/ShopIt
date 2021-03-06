import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_it/Authentication-Soham/loading.dart';
import 'package:shop_it/Seller-Chinmayee/SellerHome.dart';
import 'package:shop_it/Seller-Chinmayee/register.dart';
import 'package:shop_it/Style/text_field_decoration.dart';
import 'package:shop_it/User-Saurav/UserHome.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginUserState createState() => _LoginUserState();
}

class _LoginUserState extends State<Login> {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  bool loading = false;
  String email = '';
  String password = '';
  String error = '';
  String eror = '';
  String er = '';
  final _auth = FirebaseAuth.instance;
  final _fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: loading
          ? Loading()
          : WillPopScope(
              onWillPop: onWillPop,
              child: Scaffold(
                backgroundColor: Colors.deepPurpleAccent,
                // backgroundColor: HexColor('0a1931'),
                body: Container(
                  padding: EdgeInsets.all(20),
                  child: Form(
                    key: _fromKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          titleTextstyle('LOGIN'),
                          SizedBox(height: 25),
                          Hero(
                            tag: 'Logo',
                            child: Icon(
                              Icons.shopping_cart_outlined,
                              size: 100,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            error,
                            style: TextStyle(color: Colors.red[100]),
                          ),
                          Text(
                            eror,
                            style: TextStyle(color: Colors.red),
                          ),
                          Text(
                            er,
                            style: TextStyle(color: Colors.red),
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
                            decoration:
                                textFieldDecoration('Email', Icons.email),
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
                            obscureText: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w300,
                                color: Colors.white),
                            decoration:
                                textFieldDecoration('Password', Icons.password),
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
                                    dynamic user = _auth.currentUser;
                                    if (result != null) {
                                      try {
                                          
                                        await FirebaseFirestore.instance
                                            .collection('Users').doc(user.uid)
                                            .get()
                                            .then((element) {
                                            if (element.data()!['type'] == 'Buyer') {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      UserHome(
                                                    firstname: element['name'],
                                                  ),
                                                ),
                                              );
                                            } else if (element.data()!['type'] ==
                                                'Seller') {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      SellerHome(
                                                          firstName:
                                                              element['name']),
                                                ),
                                              );
                                            }
                                          });
                                    
                                      } catch (e) {
                                        loading = false;
                                        print(e.toString());
                                        er = e.toString();
                                        return null;
                                      }
                                    }
                                  } else {
                                    setState(() {
                                      error = 'Check your Email and Password';
                                      loading = false;
                                    });
                                  }
                                },
                                child:
                                    bodyTextstyle('Login', Colors.black, 20)),
                          ),
                          SizedBox(height: 20),

                          SizedBox(
                            height: 10,
                          ),
                          bodyTextstyle('Or Sign-up Using', Colors.white, 20),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              onPressed: () async {
                                setState(() {
                                  loading = true;
                                });
                                try {
                                  GoogleSignInAccount? googleUser =
                                      await _googleSignIn.signIn();
                                  GoogleSignInAuthentication googleAuth =
                                      await googleUser!.authentication;
                                  //final User user = _auth.
                                  loading = false;
                                  if (googleAuth.idToken != null) {
                                    setState(() {
                                      loading = false;
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => UserHome(
                                            firstname: googleUser.displayName!,
                                          ),
                                        ),
                                      );
                                    });
                                  }
                                } catch (e) {
                                  eror = e.toString();
                                }
                              },
                              icon: Image(
                                image: NetworkImage(
                                  'https://raw.githubusercontent.com/sbis04/flutterfire-samples/google-sign-in/assets/google_logo.png',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          bodyTextstyle(
                              '(If you are a SELLER please login with your email and password)',
                              Colors.white,
                              10),
                          //Add Icons for facebook
                          SizedBox(
                            height: 150,
                          ),
                          bodyTextstyle(
                              'Not Registered Yet?', Colors.white, 20),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            child: bodyTextstyle(
                              'Register Now!',
                              Colors.blue.shade200,
                              15,
                            ),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Register(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  // Future<String> role() async {
  //   FirebaseAuth _auth = FirebaseAuth.instance;
    // FirebaseUser user = await _auth.currentUser!();
  //   DocumentSnapshot snapshot =
  //       await Firestore.instance.collection("Users").document(user.uid).get();
  //   setState(() {
  //     roles = snapshot.data['Role'].toString();
  //   });
  //   String role = snapshot.data['Role'].toString();
  //   if (role == "receptionist") {
  //     useridclinic = snapshot.data['uid society'].toString();
  //   } else {
  //     useridclinic = snapshot.data['Uid'].toString();
  //   }
  //   return role;
  // }
 Future<bool> onWillPop() async {
    final shouldPop = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.deepPurpleAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90),bottomRight: Radius.circular(30),topLeft:Radius.circular(30) )),
        titleTextStyle: GoogleFonts.montserrat(fontSize: 15),
        title: Text('Are you sure?'),
        contentTextStyle: GoogleFonts.montserrat(fontSize: 20),
        content: Text('Do you want to exit the application?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: bodyTextstyle('No', Colors.white, 20),
          ),
          TextButton(
            onPressed: (){
                        setState(() {
                          FirebaseAuth.instance.signOut();
                          GoogleSignIn().signOut();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ),
                          );
                        });
                      },
            child: bodyTextstyle('Yes', Colors.white, 20),
          ),
        ],
      ),
    );

    return shouldPop ?? true;
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
