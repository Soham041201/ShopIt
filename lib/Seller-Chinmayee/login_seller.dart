import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_it/Seller-Chinmayee/SellerHome.dart';
import 'package:shop_it/Seller-Chinmayee/register_seller.dart';

class LoginSeller extends StatefulWidget {
  const LoginSeller({Key? key}) : super(key: key);

  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<LoginSeller> {
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
                   try{
                    _auth.signInWithEmailAndPassword(email: email, password: password);
                   }catch(e){}
                    if(FirebaseAuth.instance.currentUser != null){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SellerHome(),
                      ),
                        );
                    }
                  },
                  child: Text('Login'),
                ),
              SizedBox(height: 20,),
          
          Text('Not Registerted?',style: TextStyle(fontFamily:'SourceSansPro',fontWeight: FontWeight.w400,fontSize:20)),
                SizedBox(height: 10,),
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
