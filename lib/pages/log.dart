import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/pages/home.dart';
import 'package:my_app/pages/register.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  GlobalKey<FormState> key = GlobalKey<FormState>(); 
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String message = '';

  Future logIn() async{
    String url = "http://192.168.254.40/API/login.php";
    var response = await http.post(url,body: {
      'email' : email.text,
      'password' : password.text
    });

    var dataUsers = json.decode(response.body);

    if(dataUsers.length == 1){
      //goto homepage
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
    }else{
      //show invalid message
      setState(() {
        message = 'Invalid user name or password';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LogIn Page'),),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Form(
            key: key,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                    ),
                    validator: (value) => value.isEmpty ? 'this field can not be empty' : null,
                  ),
                  TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    validator: (value) => value.isEmpty ? 'this field can not be empty' : null,
                    
                  ),
                  Text(message,style: TextStyle(color: Colors.red),),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      RaisedButton(
                    color: Colors.green,
                    onPressed: (){
                      if(key.currentState.validate()){
                        logIn();
                      }
                    },
                    child: Text('LogIn', style: TextStyle(color: Colors.white),),
                    ),
                    OutlineButton(
                      onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Register()));
                      },
                      child: Text('Register'),
                      )
                    ],
                  ),
                  
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}