import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Full Name:'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Address:'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Confirm Password'),
              ),
              RaisedButton(
                child: Text('Register'),
                onPressed: (){})
            ],
          ),
        ),
        
      ),
    );
  }
}
