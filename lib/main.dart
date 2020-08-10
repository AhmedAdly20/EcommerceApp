import 'package:ecommerce/constants.dart';
import 'package:ecommerce/provider/adminMode.dart';
import 'package:ecommerce/provider/cartItem.dart';
import 'package:ecommerce/provider/modelHud.dart';
import 'package:ecommerce/screens/admin/OrdersScreen.dart';
import 'package:ecommerce/screens/admin/addProduct.dart';
import 'package:ecommerce/screens/admin/editProduct.dart';
import 'package:ecommerce/screens/admin/manageProduct.dart';
import 'package:ecommerce/screens/admin/adminHome.dart';
import 'package:ecommerce/screens/admin/order_details.dart';
import 'package:ecommerce/screens/user/cartScreen.dart';
import 'package:ecommerce/screens/user/homePage.dart';
import 'package:ecommerce/screens/signup_screen.dart';
import 'package:ecommerce/screens/user/productInfo.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  bool isUserLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('Loading...'),
              ),
            ),
          );
        } else {
          isUserLoggedIn = snapshot.data.getBool(kKeepMeLoggedIn) ?? false;
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<ModelHud>(
                create: (context) => ModelHud(),
              ),
              ChangeNotifierProvider<AdminMode>(
                create: (context) => AdminMode(),
              ),
              ChangeNotifierProvider<CartItem>(
                create: (context) => CartItem(),
              ),
            ],
            child: MaterialApp(
              initialRoute: isUserLoggedIn ? HomePage.id :LoginScreen.id,
              routes: {
                LoginScreen.id: (context) => LoginScreen(),
                SignupScreen.id: (context) => SignupScreen(),
                HomePage.id: (context) => HomePage(),
                AdminHome.id: (context) => AdminHome(),
                AddProduct.id: (context) => AddProduct(),
                ManageProduct.id: (context) => ManageProduct(),
                EditProduct.id: (context) => EditProduct(),
                ProductInfo.id: (context) => ProductInfo(),
                CartScreen.id: (context) => CartScreen(),
                OrdersScreen.id: (context) => OrdersScreen(),
                OrderDetails.id: (context) => OrderDetails(),
              },
            ),
          );
        }
      },
    );
  }
}
