import 'dart:convert';

import 'package:http/http.dart' as http;

class Service{
  
  String url = 'http://192.168.254.40:80/api/products.php';
  Future<List> getProduct() async{
    var response = await http.get(url);
    var jsonData = json.decode(response.body);
    var products = jsonData;
    return products;
  }

}