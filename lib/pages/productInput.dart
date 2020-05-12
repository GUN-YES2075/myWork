import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class ProductIn extends StatefulWidget {
  @override
  _ProductInState createState() => _ProductInState();
}

class _ProductInState extends State<ProductIn> {
  GlobalKey<FormState> key = GlobalKey<FormState>(); 
  TextEditingController itemname = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController description = TextEditingController();

  Future addItem() async{
    String url = "http://192.168.254.40/API/addItem.php";
    http.post(url,body: {
      'itemname' : itemname.text,
      'price' : price.text,
      'description' : description.text
    });
    setState(() {
      itemname.clear();
      price.clear();
      description.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Product'),),
      body: SingleChildScrollView(
        child: Form(
      key: key,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: itemname,
              decoration: InputDecoration(
                labelText: 'Itemname',
              ),
              validator: (value) => value.isEmpty ? 'this field can not be empty' : null,
            ),
            TextFormField(
              controller: price,
              decoration: InputDecoration(
                labelText: 'Price',
              ),
              validator: (value) => value.isEmpty ? 'this field can not be empty' : null,
              
            ),
            TextFormField(
              controller: description,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
              validator: (value) => value.isEmpty ? 'this field can not be empty' : null,
              
            ),
            RaisedButton(
              color: Colors.green,
              onPressed: (){
                if(key.currentState.validate()){
                  addItem();
                  Toast.show("Record is saved", context, duration: Toast.LENGTH_LONG, gravity:  Toast.CENTER);
                }
                Navigator.pop(context);
              },
              
              child: Text('Add', style: TextStyle(color: Colors.white),),
              ),
          ],
        ),
      ),
    ),
      ),
    );
  }
}