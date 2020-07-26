import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/signup_screen.dart';
import 'package:ecommerce/widgets/custom_logo.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/cutsom_textfield.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  static String id = 'LoginScreen';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kMainColor,
      body: Form(
        key: _globalKey,
        child: ListView(
          children: <Widget>[
            CustomLogo(),
            SizedBox(
              height: height*0.1,
            ),
            CustomTextField(
              hint: 'Enter Your E-Mail',
              icon: Icons.email
            ),
            SizedBox(
              height: height*0.01,
            ),
            CustomTextField(
              hint: 'Enter Your Password',
              icon: Icons.lock,
            ),
            SizedBox(
              height: height*0.04,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
                ),
                onPressed: (){
                  if (_globalKey.currentState.validate()) {
                    // Todo
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: height*0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Don\'t have an account ? ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, SignupScreen.id);
                  },
                  child: Text(
                  'Signup',
                  style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}