import 'package:coffee_app/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';

class WrapperPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return either the Home or Authenticate widget
    return Authenticate();
  }
}
