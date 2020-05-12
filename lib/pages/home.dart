

import 'package:flutter/material.dart';
import 'package:my_app/pages/log.dart';
import 'package:my_app/pages/prodects.dart';
import 'package:my_app/pages/productInput.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: <Widget>[
          Row(
          children: <Widget>[
            Text('Add Item', textScaleFactor: 1.25,),
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductIn()));
              }),
              IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
                size: 30,
              ),
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LogIn()));
              }),
          ],)
          
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Products(),
          ],
        ),
      ),
    );
  }
}
