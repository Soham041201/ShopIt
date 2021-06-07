// Create a home page for the user where he will be able to see the list of items added by seller.

// Hint: Use List view widget to show the list.
import 'package:flutter/material.dart';
class UserHome extends StatefulWidget {
  const UserHome({ Key? key }) : super(key: key);

  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
     child: Text('User Home'),
    );
  }
}