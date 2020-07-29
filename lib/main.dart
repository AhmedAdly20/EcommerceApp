import 'package:ecommerce/provider/adminMode.dart';
import 'package:ecommerce/provider/modelHud.dart';
import 'package:ecommerce/screens/admin/addProduct.dart';
import 'package:ecommerce/screens/admin/editProduct.dart';
import 'package:ecommerce/screens/admin/adminHome.dart';
import 'package:ecommerce/screens/user/homePage.dart';
import 'package:ecommerce/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/screens/login_screen.dart';
import 'package:provider/provider.dart';

main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ModelHud>(
          create: (context) => ModelHud(),
        ),
        ChangeNotifierProvider<AdminMode>(
          create: (context) => AdminMode(),
        )
      ],
      child: MaterialApp(
          initialRoute: LoginScreen.id,
          routes: {
            LoginScreen.id: (context)=> LoginScreen(),
            SignupScreen.id: (context)=> SignupScreen(),
            HomePage.id: (context) =>HomePage(),
            AdminHome.id: (context) =>AdminHome(),
            AddProduct.id: (context) =>AddProduct(),
            EditProduct.id : (context) =>EditProduct(),
          },
      ),
    );
  }
}