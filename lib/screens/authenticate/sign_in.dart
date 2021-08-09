import 'package:coffee_app/services/auth.dart';
import 'package:coffee_app/widgets/loading.dart';
import 'package:coffee_app/widgets/widgets.dart';
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

  bool isLoading = false;

  // Text Field State
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomInset: false,
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
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
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
                      validator: (_val) =>
                          _val.isEmpty ? "Enter an email" : null,
                      onChanged: (val) => setState(() => email = val),
                      decoration: textInputDecoration.copyWith(
                        hintText: 'example@domain.com',
                        labelText: "Email",
                      ),
                    ),
                    SizedBox(height: 20.0),
                    // TODO Password
                    TextFormField(
                      validator: (_val) => _val.length < 6
                          ? "Minimum 6 characters required"
                          : null,
                      onChanged: (val) => setState(() => password = val),
                      obscureText: true,
                      decoration:
                          textInputDecoration.copyWith(labelText: "Password"),
                    ),
                    SizedBox(height: 30.0),
                    // TODO Button
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() => isLoading = true);
                          dynamic result = await _auth
                              .signInWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() {
                              error =
                                  "Couldn't sign in with those credentials !";
                              isLoading = false;
                            });
                          }
                        }
                        // print('Valid');
                      },
                      style: ElevatedButton.styleFrom(
                        // foreground color
                        // onPrimary: Colors.black,
                        // background color
                        primary: Colors.green[500],
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                        ),
                      ),
                      // style: ButtonStyle(
                      //   backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                      // ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Text(error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0)),
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
