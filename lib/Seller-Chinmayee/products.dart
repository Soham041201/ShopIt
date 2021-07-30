import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  String shopName = '';
  Future getdetails() async {
    await FirebaseFirestore.instance
        .collection('ShopDetails')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((element) {
        shopName = element['shop'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    getdetails();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(child: Text('Refresh'), onPressed: getdetails),
            Text(shopName),
          ],
        ),
      ),
    );
  }
}
