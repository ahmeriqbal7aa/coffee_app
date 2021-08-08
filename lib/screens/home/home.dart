import 'package:coffee_app/services/auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          actions: <Widget>[
            // ignore: deprecated_member_use
            FlatButton.icon(
              onPressed: () async {
                await _authService.signOut();
              },
              icon: Icon(Icons.person),
              label: Text(
                'Sign out',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
