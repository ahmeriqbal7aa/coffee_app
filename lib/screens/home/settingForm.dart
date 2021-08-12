import 'package:coffee_app/models/user.dart';
import 'package:coffee_app/services/database.dart';
import 'package:coffee_app/widgets/loading.dart';
import 'package:coffee_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingForm extends StatefulWidget {
  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];
  final List<int> strengths = [100, 200, 300, 400, 500, 600, 700, 800, 900];

  // form values
  String _currentName;
  String _currentSugars;
  String _currentStrength;

  @override
  Widget build(BuildContext context) {
    Usser user = Provider.of<Usser>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    'Update your Coffee Settings...',
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: userData.name,
                    decoration: textInputDecoration,
                    validator: (value) =>
                        value.isEmpty ? "Name is required" : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  SizedBox(height: 10.0),
                  DropdownButtonFormField(
                    value: _currentSugars ?? userData.sugars,
                    decoration: textInputDecoration,
                    items: sugars.map((sugar) {
                      return DropdownMenuItem(
                        value: sugar,
                        child: Text('$sugar sugar(s)'),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() => _currentSugars = val),
                  ),
                  SizedBox(height: 10.0),
                  Slider(
                    label: "Strengths",
                    min: 100.0,
                    max: 900.0,
                    // total 8 divisions as we go from 100 to 900
                    divisions: 8,
                    onChanged: (val) => setState(
                        () => _currentStrength = val.toStringAsFixed(0)),
                    value: double.parse(_currentStrength ?? userData.strength),
                    activeColor: Colors.brown[
                        int.parse(_currentStrength ?? userData.strength)],
                    inactiveColor: Colors.brown[
                        int.parse(_currentStrength ?? userData.strength)],
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    color: Colors.brown[500],
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Update',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 17.0,
                        ),
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        await DatabaseService(uid: user.uid).updateUserData(
                          _currentSugars ?? userData.sugars,
                          _currentName ?? userData.name,
                          _currentStrength ?? userData.strength,
                        );
                        Navigator.pop(context);
                      }
                      // print(_currentName);
                      // print(_currentSugars);
                      // print(_currentStrength);
                    },
                  ),
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
