import 'package:flutter/material.dart';
import 'package:shop_it/Style/text_field_decoration.dart';

class AddItems extends StatefulWidget {
  const AddItems({Key? key}) : super(key: key);

  @override
  _AddItemsState createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  String product_name = '';
  String cost = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              bodyTextstyle('Add your products', Colors.blue, 24),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.black),
                  validator: (val) =>
                      val!.isEmpty ? 'Enter the name of your product' : null,
                  onChanged: (val) {
                    setState(() => product_name = val);
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.shopping_cart,
                      color: Colors.blue.shade900,
                    ),
                    fillColor: Colors.white,
                    counterStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w200),
                    labelText: 'Product Name',
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
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.black),
                  validator: (val) =>
                      val!.isEmpty ? 'Enter the cost of your product' : null,
                  onChanged: (val) {
                    setState(() => cost= val);
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.money,
                      color: Colors.blue.shade900,
                    ),
                    fillColor: Colors.white,
                    counterStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w200),
                    labelText: 'Product Cost',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
