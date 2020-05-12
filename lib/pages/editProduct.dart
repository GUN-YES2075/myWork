import 'package:flutter/material.dart';
import 'package:my_app/pages/prodects.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;


class EditProduct extends StatefulWidget {
  final name;
  final price;
  final description;
  EditProduct({this.name,this.price,this.description});
  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  GlobalKey<FormState> key = GlobalKey<FormState>(); 
  TextEditingController itemname = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController description = TextEditingController();

  Future editItem() async{
    String url = "http://192.168.254.40/API/editItme.php";
    http.post(url,body: {
      'itemname' : itemname.text,
      'price' : price.text,
      'description' : description.text
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Product Section'),),
      body: Wrap(
        children: <Widget>[
          Form(
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
                      
                      Toast.show("Record is saved", context, duration: Toast.LENGTH_LONG, gravity:  Toast.CENTER);
                    }
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Products()));
                  },
                  
                  child: Text('Update', style: TextStyle(color: Colors.white),),
                  ),
              ],
            ),
          ),
    ),
        ],
      ),
    );
  }
}