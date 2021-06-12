import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_it/Seller-Chinmayee/wrapper_seller.dart';
import 'package:shop_it/User-Saurav/wrapper_user.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'YOU ARE A?',
              textScaleFactor: 2,
            ),
            SizedBox(
              height: 20,
            ),
            CupertinoButton(
              child: Text(
                'SELLER',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WrapperSeller()),
                );
              },
              color: Colors.white,
            ),
            SizedBox(
              height: 20,
            ),
            CupertinoButton(
              child: Text(
                'USER',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WrapperUser()),
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
