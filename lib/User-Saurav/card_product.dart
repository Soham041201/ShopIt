import 'package:flutter/material.dart';





class ProductCard extends StatelessWidget{

  var image_link;
  var product_pricing;
  var product_name;

  ProductCard(String link, String name, int price){

    this.image_link = link;
    this.product_name = name;
    this.product_pricing = price.toString();

  }
  

  @override 
  Widget build(BuildContext context){
    return Padding(
                          padding: EdgeInsets.all(10),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: Colors.white,
                            elevation: 5,
                            child: Container(
                              height: 200,
                              width: 175,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Container(
                                      height: 150,
                                      width: 150,
                                      child: Image.network(image_link),
                                    ),
                                  ),
                                  Container(
                                    height: 45,
                                    child: Padding(
                                      padding: EdgeInsets.all(3),
                                      child: Text(product_name,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '\$'+product_pricing,
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Icon(
                                          Icons.add,
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );

  }
}