// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/models/brew.dart';
import 'package:coffee_app/screens/home/coffeeList.dart';
import 'package:coffee_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:coffee_app/services/database.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: Text('Bottom Sheet'),
            );
          });
    }

    //  StreamProvider<QuerySnapshot>.value
    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().coffeeSnapshot,
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
            IconButton(
              padding: EdgeInsets.only(right: 12.0),
              icon: Icon(Icons.settings, color: Colors.black, size: 30.0),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
