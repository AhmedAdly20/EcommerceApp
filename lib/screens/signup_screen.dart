import 'package:ecommerce/constants.dart';
import 'package:ecommerce/provider/modelHud.dart';
import 'package:ecommerce/screens/login_screen.dart';
import 'package:ecommerce/screens/user/homePage.dart';
import 'package:ecommerce/widgets/custom_logo.dart';
import 'package:ecommerce/widgets/cutsom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/services/auth.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  static String id = 'SignupScreen';
  String _email, _password;
  final _auth = Auth();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kMainColor,
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModelHud>(context).isLoading,
        child: Form(
          key: _globalKey,
          child: ListView(
            children: <Widget>[
              CustomLogo(),
              SizedBox(
                height: height * 0.1,
              ),
              CustomTextField(
                onClick: (){},
                hint: 'Enter Your Name',
                icon: Icons.perm_identity,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              CustomTextField(
                  onClick: (value) {
                    _email = value;
                  },
                  hint: 'Enter Your E-Mail',
                  icon: Icons.email),
              SizedBox(
                height: height * 0.01,
              ),
              CustomTextField(
                onClick: (value) {
                  _password = value;
                },
                hint: 'Enter Your Password',
                icon: Icons.lock,
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child: Builder(
                  builder: (context) {
                    return FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      onPressed: () async {
                        final modelHud =
                            Provider.of<ModelHud>(context, listen: false);
                        modelHud.changeIsLoading(true);
                        if (_globalKey.currentState.validate()) {
                          try {
                            _globalKey.currentState.save();
                            final _authResult =
                                await _auth.signUp(_email, _password);
                            modelHud.changeIsLoading(false);
                            Navigator.pushNamed(context, HomePage.id);
                          } on PlatformException catch (e) {
                            modelHud.changeIsLoading(false);
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(
                                e.message,
                              ),
                            ));
                          }
                        }
                        modelHud.changeIsLoading(false);
                      },
                      child: Text(
                        'Signup',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.black,
                    );
                  },
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Do have an account ? ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
