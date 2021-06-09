import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_it/Seller-Chinmayee/SellerHome.dart';
import 'package:shop_it/User-Saurav/UserHome.dart';
import 'package:shop_it/User-Saurav/login_user.dart';

class RegisterSeller extends StatefulWidget {
  const RegisterSeller({Key? key}) : super(key: key);

  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterSeller> {
  String email = '';
  String password = '';
  final _auth = FirebaseAuth.instance;
  final _fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _fromKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  textAlign: TextAlign.center,
                    style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w300) ,
                    decoration: InputDecoration(hintText: 'Email'),
                    validator: (val) => val!.isEmpty ? 'Enter your Email':null ,
                    onChanged: (val){
                      setState(()=>email=val);
                    },
                  ),
                        SizedBox(height: 20,),
               TextFormField(
                 textAlign: TextAlign.center,
                    style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w300) ,
                    decoration: InputDecoration(hintText: 'Password'),
                    validator: (val) => val!.isEmpty ? 'Enter your Password':null ,
                    onChanged: (val){
                      setState(()=>password=val);
                    },
                  ),
                  SizedBox(height: 20,),
                CupertinoButton(
                  
                  color: Colors.blue,
                  onPressed: () async {
                    _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                       
                    if(_auth.currentUser !=null){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SellerHome(),
                      ),
                        );
                    }
                  },
                  child: Text('Register'),
                ),
              SizedBox(height: 20,),
          
      Text('Already Registerted?',style: TextStyle(fontFamily:'SourceSansPro',fontWeight: FontWeight.w400,fontSize:20)),
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
      ),
    );
  }
}
