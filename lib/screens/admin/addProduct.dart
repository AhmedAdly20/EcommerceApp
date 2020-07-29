import 'package:ecommerce/widgets/cutsom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/services/store.dart';
import 'package:ecommerce/models/product.dart';

class AddProduct extends StatelessWidget {
  static String id = 'AddProduct';
  String _name, _price, _description, _category, _imageLocation;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final _store = Store();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _globalKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomTextField(
              onClick: (value){
                _name = value;
              },
              hint:'Product Name',
              icon: Icons.local_offer
            ),
            SizedBox(height: 10,),
            CustomTextField(
              onClick: (value){
                _price = value;
              },
              hint:'Product Price',
              icon: Icons.monetization_on
            ),
            SizedBox(height: 10,),
            CustomTextField(
              onClick: (value){
                _description = value;
              },
              hint:'Product Description',
              icon: Icons.description
            ),
            SizedBox(height: 10,),
            CustomTextField(
              onClick: (value){
                _category = value;
              },
              hint:'Product Category',
              icon: Icons.category
            ),
            SizedBox(height: 10,),
            CustomTextField(
              onClick: (value){
                _imageLocation = value;
              },
              hint:'Product Location',
              icon: Icons.add_location
            ),
            SizedBox(height: 20,),
            RaisedButton(
              onPressed: (){
                if (_globalKey.currentState.validate()) {
                  _globalKey.currentState.save();
                  _store.addProduct(Product(
                    pName: _name,
                    pPrice: _price,
                    pCategory: _category,
                    pDescription: _description,
                    pLocation: _imageLocation
                  ));
                }
              },
              child: Text('Add Product'),
            )
          ],
        ),
      ),
    );
  }
}