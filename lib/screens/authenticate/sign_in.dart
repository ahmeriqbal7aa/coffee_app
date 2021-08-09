import 'package:coffee_app/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // Text Field State
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text('Sign In to Brew Crew'),
        actions: <Widget>[
          // ignore: deprecated_member_use
          FlatButton.icon(
            onPressed: () => widget.toggleView(),
            icon: Icon(Icons.person),
            label: Text(
              'Register',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20.0),
              // TODO Email
              TextFormField(
                validator: (_val) => _val.isEmpty ? "Enter an email" : null,
                onChanged: (val) => setState(() => email = val),
              ),
              SizedBox(height: 20.0),
              // TODO Password
              TextFormField(
                validator: (_val) =>
                    _val.length < 6 ? "Minimum 6 characters required" : null,
                onChanged: (val) => setState(() => password = val),
                obscureText: true,
              ),
              SizedBox(height: 30.0),
              // ignore: deprecated_member_use
              RaisedButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result =
                        await _auth.signInWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() =>
                          error = "Couldn't sign in with those credentials !");
                    }
                  }
                  // print('Valid');
                },
                color: Colors.teal[500],
                child: Text(
                  'Sign in',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 17.0,
                  ),
                ),
              ),
              SizedBox(height: 12.0),
              Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0)),
            ],
          ),
        ),
      ),
    );
  }
}

// SignIn Anonymously
// ignore: deprecated_member_use
/*RaisedButton(
          child: Text('Sign in Anonymous'),
          onPressed: () async {
            dynamic result = await _auth.signInAnonymous();
            if (result == null) {
              print('Error Signing In');
            } else {
              print('Signed in');
              print(result);
              print(result.uid);
            }
          },
        ),*/
