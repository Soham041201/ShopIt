import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_it/User-Saurav/card_product.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Products')
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            return SizedBox(
              height: 300,
              child: ListView.builder(
           
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return ProductCard(snapshot.data!.docs[index]['imagelink'],snapshot.data!.docs[index]['productName'],snapshot.data!.docs[index]['productCost']);
                  }),
            );
          }),
    );
  }
}
