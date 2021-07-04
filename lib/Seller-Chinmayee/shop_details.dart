import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_it/Seller-Chinmayee/seller_home_page_body.dart';
import 'package:shop_it/Style/text_field_decoration.dart';
import 'package:shop_it/User-Saurav/login.dart';

class ShopDetails extends StatefulWidget {
  const ShopDetails({Key? key}) : super(key: key);

  @override
  _ShopDetailsState createState() => _ShopDetailsState();
}

class _ShopDetailsState extends State<ShopDetails> {
  final _fromKey = GlobalKey<FormState>();
  final _firestore = FirebaseFirestore.instance;
  String shopName = '';
  String shopAddress = '';
  String delivery = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('0a1931'),
        actions: [],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(child: titleTextstyle('ShopIt')),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _fromKey,
            child: Column(
              children: [
                SizedBox(height: 5),
                bodyTextstyle('Complete your Shop Details', Colors.blue, 22),
                SizedBox(height: 5),
                TextFormField(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                  validator: (val) => val!.isEmpty ? 'Enter your Name' : null,
                  onChanged: (val) {
                    // setState(() => firstName = val);
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.shopping_cart,
                      color: Colors.blue.shade900,
                    ),
                    fillColor: Colors.white,
                    counterStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w200),
                    labelText: 'Shop type',
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w200),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.greenAccent, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                  validator: (val) =>
                      val!.isEmpty ? 'Enter the name of your shop' : null,
                  onChanged: (val) {
                    // setState(() => firstName = val);
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.map,
                      color: Colors.blue.shade900,
                    ),
                    fillColor: Colors.white,
                    counterStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w200),
                    labelText: 'Shop Address',
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w200),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.greenAccent, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                TextFormField(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                  validator: (val) =>
                      val!.isEmpty ? 'Enter the name of your shop' : null,
                  onChanged: (val) {
                    // setState(() => firstName = val);
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.maps_ugc,
                      color: Colors.blue.shade900,
                    ),
                    fillColor: Colors.white,
                    counterStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w200),
                    labelText: 'Do you provide delivery?',
                    labelStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w200),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.greenAccent, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CupertinoButton(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  color: CupertinoColors.activeBlue,
                  disabledColor: CupertinoColors.systemYellow,
                  onPressed: () async {
                    if (_fromKey.currentState!.validate()) {
                      await _firestore.collection('ShopDetails').add(
                        {
                          'shop': shopName,
                          'address': shopAddress,
                          'delivery': delivery,
                        },
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SellerHomePageBody()),
                      );
                    }
                  },
                  child: bodyTextstyle(
                    'SAVE',
                    Colors.white,
                    15,
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
