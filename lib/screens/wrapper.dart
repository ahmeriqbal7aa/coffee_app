import 'package:coffee_app/models/user.dart';
import 'package:coffee_app/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

class WrapperPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Usser>(context);
    print(user);

    // return either the Home or Authenticate widget
    return Authenticate();
  }
}
