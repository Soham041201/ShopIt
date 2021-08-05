import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_it/Seller-Chinmayee/register.dart';
import 'package:shop_it/Style/text_field_decoration.dart';
import 'package:shop_it/User-Saurav/login.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.purple[400],
       backgroundColor:Colors.deepPurpleAccent,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Hero(
              tag: 'Logo',
              child: Icon(
                Icons.shopping_cart_outlined,
                size: 200,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            titleTextstyle('DO YOU WANT TO?'),
            SizedBox(
              height: 20,
            ),
            Container(
                width: 230,
                child: CupertinoButton(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                    child: bodyTextstyle('REGISTER', Colors.black, 18))),
            SizedBox(
              height: 18,
            ),
            Container(
              width: 230,
              child: CupertinoButton(
                child: bodyTextstyle('LOGIN', Colors.black, 18),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
