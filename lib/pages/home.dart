import 'package:flutter/material.dart';
import 'package:my_app/model/service.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products'),),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FutureBuilder(
              future: Service().getProduct(),
              builder: (context,snapshot){
                if(!snapshot.hasData){
                  return Text('Loading....');
                }else{
                  return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (context,index){
                var callData = snapshot.data[index];
                return ListTile(
                  title: Text(callData['name']),
                  subtitle: Text('Rs.' + callData['price'].toString()),
                );
              }
              );
                }
              }
              )
          ],
        ),
      ),
    );
     
    
  }
}