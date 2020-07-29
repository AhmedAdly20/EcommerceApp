import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/admin/addProduct.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/screens/admin/editProduct.dart';

class AdminHome extends StatefulWidget {
  static String id = 'AdminHome';
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
          ),
          RaisedButton(
            onPressed: (){
              Navigator.pushNamed(context, AddProduct.id);
            },
            child: Text('Add Product'),
          ),
          RaisedButton(
            onPressed: (){
              Navigator.pushNamed(context, EditProduct.id);
            },
            child: Text('Edit Product'),
          ),
          RaisedButton(
            onPressed: (){},
            child: Text('View Orders'),
          ),
        ],
      ),
    );
  }
}