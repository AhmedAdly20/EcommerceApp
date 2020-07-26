import 'package:ecommerce/constants.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/cutsom_textfield.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'LoginScreen';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kMainColor,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Container(
              height: MediaQuery.of(context).size.height*0.2,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage('images/icons/buyicon.png'),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Text(
                      'Buy It',
                      style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 25,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: height*0.1,
          ),
          CustomTextField(
            hint: 'Enter Your Email',
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
              onPressed: (){},
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
              Text(
                'Signup',
                style: TextStyle(fontSize: 16),
              )
            ],
          )
        ],
      ),
    );
  }
}