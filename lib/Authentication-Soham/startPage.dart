import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_it/Seller-Chinmayee/wrapper_seller.dart';
import 'package:shop_it/Style/text_field_decoration.dart';
import 'package:shop_it/User-Saurav/login_user.dart';
import 'package:shop_it/User-Saurav/wrapper_user.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('0a1931'),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            titleTextstyle('DO YOU WANT TO?'),
            SizedBox(
              height: 20,
            ),
            Container(
                width: 200,
                child: CupertinoButton(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WrapperSeller()),
                      );
                    },
                    child: bodyTextstyle('SELL', Colors.black, 18))),
            SizedBox(
              height: 18,
            ),
            Container(
              width: 200,
              child: CupertinoButton(
                child: bodyTextstyle('BUY', Colors.black, 18),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WrapperUser()),
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
