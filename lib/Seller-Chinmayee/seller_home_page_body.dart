import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_it/Seller-Chinmayee/add_items.dart';
import 'package:shop_it/Seller-Chinmayee/shop_details.dart';
import 'package:shop_it/Style/text_field_decoration.dart';
import 'package:shop_it/User-Saurav/login.dart';

class SellerHomePageBody extends StatefulWidget {
  const SellerHomePageBody({Key? key}) : super(key: key);

  @override
  _SellerHomePageBodyState createState() => _SellerHomePageBodyState();
}

class _SellerHomePageBodyState extends State<SellerHomePageBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: HexColor('0a1931'),
        elevation: 0.1,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddItems()),
                      );},
      ),
      
      body: Padding(
            
        padding: const EdgeInsets.only(left: 50, top: 10, right: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

                            bodyTextstyle('Complete your details to continue',
                  Colors.blue.shade700, 28),
              SizedBox(
                height: 10,
              ),
              CupertinoButton(
                  padding: EdgeInsets.all(5.0),
                  color: Colors.yellow,
                  disabledColor: CupertinoColors.systemYellow,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ShopDetails()),
                    );
                  },
                  child: bodyTextstyle(
                    'Complete your details now',
                    Colors.blue,
                    15,
                  )),

                  Text(''),
            ],
          ),
        ),
      ),
    );
  }
    dialogBox() {
     showDialog(
      context: context,
      builder: (context) => AlertDialog(
        titleTextStyle: GoogleFonts.montserrat(fontSize: 15),
        title: Text('Are you sure?'),
        contentTextStyle: GoogleFonts.montserrat(fontSize: 20),
        content: Text('Do you want to exit the application?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: bodyTextstyle('No', Colors.blue.shade500, 20),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShopDetails(),
                  ),
                );
              });
            },
            child: bodyTextstyle('Yes', Colors.blue.shade500, 20),
          ),
        ],
      ),
    );
  }
}
