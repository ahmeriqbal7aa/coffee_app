// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/models/brew.dart';
import 'package:coffee_app/screens/home/coffeeTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    // final coffee = Provider.of<QuerySnapshot>(context);
    // print(coffee.docs);
    // for (var doc in coffee.docs) {
    //   print(doc.data);
    // }
    final coffee = Provider.of<List<Brew>>(context);
    // coffee.forEach((brew) {
    //   print(brew.name);
    //   print(brew.sugars);
    //   print(brew.strength);
    // });
    return ListView.builder(
      itemCount: coffee.length,
      itemBuilder: (context, index) {
        return BrewTile(brew: coffee[index]);
      },
    );
  }
}
