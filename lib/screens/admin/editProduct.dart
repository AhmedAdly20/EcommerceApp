import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/product.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/services/store.dart';

class EditProduct extends StatefulWidget {
  static String id = 'EditProduct';

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final _store = Store();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _store.loadProducts(),
        builder:(context , snapshot) {
          if (snapshot.hasData) {
            List<Product> products= [];
            for (var doc in snapshot.data.documents) {
              var data = doc.data;
              products.add(Product(
                pCategory: data[kProductCategory],
                pDescription: data[kProductDescription],
                pLocation: data[kProductLocation],
                pName: data[kProductName],
                pPrice: data[kProductPrice],
              ));
            }
            return ListView.builder(
            itemBuilder: (context , index) => Text(products[index].pName),
            itemCount: products.length,
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }
      ),
    );
  }
}