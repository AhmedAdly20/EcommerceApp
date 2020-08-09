import 'dart:ui';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/provider/cartItem.dart';
import 'package:ecommerce/screens/user/productInfo.dart';
import 'package:ecommerce/services/store.dart';
import 'package:ecommerce/widgets/custom_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/cupertino.dart';

class CartScreen extends StatelessWidget {
  static String id = 'CartScreen';
  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<CartItem>(context).products;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double appBarHeight = AppBar().preferredSize.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'My Cart',
          style: TextStyle(color: Colors.black),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          LayoutBuilder(
            builder: (context, constrains) {
              if (products.isNotEmpty) {
                return Container(
                  height: screenHeight -
                      statusBarHeight -
                      appBarHeight -
                      (screenHeight * .08),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: GestureDetector(
                          onTapUp: (details) {
                            showCustomMenu(details, context, products[index]);
                          },
                          child: Container(
                            height: screenHeight * 0.15,
                            child: Row(
                              children: <Widget>[
                                CircleAvatar(
                                  radius: screenHeight * 0.15 / 2,
                                  backgroundImage:
                                      AssetImage(products[index].pLocation),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              products[index].pName,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              '\$ ${products[index].pPrice}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: Text(
                                          products[index].pQuantity.toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            color: kSecondaryColor,
                          ),
                        ),
                      );
                    },
                    itemCount: products.length,
                  ),
                );
              } else {
                return Container(
                  height: screenHeight -
                      (screenHeight * .08) -
                      appBarHeight -
                      statusBarHeight,
                  child: Center(
                    child: Text('There is no items in the cart'),
                  ),
                );
              }
            },
          ),
          Builder(
            builder: (context) => ButtonTheme(
              minWidth: screenWidth,
              height: screenHeight * .08,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
              ),
              child: RaisedButton(
                onPressed: () {
                  showCustomDialog(products, context);
                },
                child: Text('Order'.toUpperCase()),
                color: kMainColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  showCustomMenu(details, context, product) async {
    double dx = details.globalPosition.dx;
    double dy = details.globalPosition.dy;
    double dx2 = MediaQuery.of(context).size.width - dx;
    double dy2 = MediaQuery.of(context).size.height - dy;
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
      items: [
        MyPopUpMenuItem(
          onClick: () {
            Navigator.pop(context);
            Provider.of<CartItem>(context, listen: false)
                .deleteProduct(product);
            Navigator.pushNamed(context, ProductInfo.id, arguments: product);
          },
          child: Text('Edit'),
        ),
        MyPopUpMenuItem(
          onClick: () {
            Navigator.pop(context);
            Provider.of<CartItem>(context, listen: false)
                .deleteProduct(product);
          },
          child: Text('Delete'),
        ),
      ],
    );
  }

  getTotalPrice(List<Product> products) {
    var price = 0;
    for (var product in products) {
      price += product.pQuantity * int.parse(product.pPrice);
    }
    return price;
  }

  void showCustomDialog(List<Product> products, context) async {
    var price = getTotalPrice(products);
    var address;
    AlertDialog alertDialog = AlertDialog(
      title: Text('Total Price = \$ $price'),
      content: TextField(
        onChanged: (value) {
          address = value;
        },
        decoration: InputDecoration(hintText: 'Enter Your Address'),
      ),
      actions: [
        MaterialButton(
          onPressed: () {
            try {
              Store _store = Store();
              _store.storeOrders({
                kTotallPrice: price,
                kAddress: address,
              }, products);
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('Your Order Is Done Wait For It'),
                ),
              );
              Navigator.pop(context);
            } catch (e) {
              print(e.message);
            }
          },
          child: Text('Confirm'),
        )
      ],
    );
    await showDialog(
      context: context,
      builder: (context) {
        return alertDialog;
      },
    );
  }
}
