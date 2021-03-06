import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coffee_app/models/brew.dart';

class BrewTile extends StatelessWidget {
  final Brew brew;
  BrewTile({this.brew});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[int.parse(brew.strength)],
            backgroundImage: AssetImage('images/coffee_icon.png'),
          ),
          trailing: Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: Text(
              "Strength: " + brew.strength,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.brown,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          title: Text(brew.name),
          subtitle: Text('Takes ${brew.sugars} sugar(s)'),
        ),
      ),
    );
  }
}
