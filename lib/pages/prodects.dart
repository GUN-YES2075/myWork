import 'package:flutter/material.dart';
import 'package:my_app/model/service.dart';
import 'package:my_app/pages/editProduct.dart';
import 'package:my_app/pages/itemDetails.dart';

class Products extends StatefulWidget {
  // final List list;
  // final int index;
  // Products({this.list,this.index});
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  void confirm(){
    AlertDialog(
      content: Text('Are you sure want to delete?'),
      actions: <Widget>[
        RaisedButton(
          onPressed:(){},
          child: Text('OK'),
          ),
          RaisedButton(
          onPressed:(){
            Navigator.pop(context);
          },
          child: Text('CANCEL'),
          )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return   FutureBuilder(
            future: Service().getProduct(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Text('Loading....');
              } else {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      var callData = snapshot.data[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ItemDetails(
                                        name: callData['name'],
                                        price: callData['price'],
                                        description: callData['description'],
                                      )));
                        },
                        child: Card(
                          elevation: 2,
                          color: Colors.green,
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                child: Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          callData['name'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Rs.' + callData['price'].toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProduct(name: callData['name'], price: callData['price'],description: callData['description'],)));
                                  }),
                              IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                  onPressed: (){
                                    confirm();
                                  }),
                            ],
                          ),
                        ),
                      );
                    });
              }
            });
     
  }
}
