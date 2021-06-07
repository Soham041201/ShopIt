import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_it/Seller-Chinmayee/register_seller.dart';
import 'package:shop_it/User-Saurav/register_user.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'YOU ARE A?',
              textScaleFactor: 2,
            ),
            SizedBox(
              height: 250,
            ),
            CupertinoButton(
              child: Text(
                'SELLER',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterSeller()),
                );
              },
              color: Colors.white,
            ),
            SizedBox(
              height: 20,
            ),
            CupertinoButton(
              child: Text(
                'BUYER',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterUser()),
                );
              },
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
