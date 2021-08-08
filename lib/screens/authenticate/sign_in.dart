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

  // Text Field State
  String email = "";
  String password = "";

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
          child: Column(
            children: [
              SizedBox(height: 20.0),
              // TODO Email
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 20.0),
              // TODO Password
              TextFormField(
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(height: 30.0),
              // ignore: deprecated_member_use
              RaisedButton(
                onPressed: () async {
                  // dynamic result = await _auth.signInAnonymous();
                  // if (result == null) {
                  //   print('Error Signing In');
                  // } else {
                  //   print('Signed in');
                  //   print(result);
                  //   print(result.uid);
                  // }
                  print(email);
                  print(password);
                },
                color: Colors.purple[400],
                child: Text(
                  'Sign in',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 17.0,
                  ),
                ),
              ),
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
