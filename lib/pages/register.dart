import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/pages/log.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> key = GlobalKey<FormState>(); 
  TextEditingController fullname = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future signUp() async{
    String url = "http://192.168.254.40/API/user.php";
    http.post(url,body: {
      'fullname' : fullname.text,
      'address' : address.text,
      'mobile' : mobile.text,
      'email' : email.text,
      'password' : password.text
    });
    setState(() {
      fullname.clear();
      address.clear();
      mobile.clear();
      email.clear();
      password.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register Page'),),
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
                    controller: fullname,
                    decoration: InputDecoration(
                      labelText: 'Full name',
                    ),
                    validator: (value) => value.isEmpty ? 'this field can not be empty' : null,
                  ),
                  TextFormField(
                    controller: address,
                    decoration: InputDecoration(
                      labelText: 'Address',
                    ),
                    validator: (value) => value.isEmpty ? 'this field can not be empty' : null,
                    
                  ),
                  TextFormField(
                    controller: mobile,
                    decoration: InputDecoration(
                      labelText: 'Mobile No.',
                    ),
                    validator: (value) => value.isEmpty ? 'this field can not be empty' : null,
                    
                  ),
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (value) => value.isEmpty ? 'this field can not be empty' : null,
                    
                  ),
                  TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    validator: (value) => value.isEmpty ? 'this field can not be empty' : null,
                    
                  ),
                  RaisedButton(
                    color: Colors.green,
                    onPressed: (){
                      if(key.currentState.validate()){
                        signUp();
                      }
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LogIn()));
                    },
                    child: Text('SignUp', style: TextStyle(color: Colors.white),),
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