import 'package:coffee_app/screens/home/home.dart';
import 'package:flutter/material.dart';

class WrapperPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return either the Home or Authenticate widget
    return HomePage();
  }
}
