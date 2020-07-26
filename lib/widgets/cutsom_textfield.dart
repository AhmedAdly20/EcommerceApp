import 'package:flutter/material.dart';
import 'package:ecommerce/constants.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  String _errorMessage(String str) {
    switch (hint) {
      case 'Enter Your Name':
        return 'Name is empty !';
      case 'Enter Your E-Mail':
        return 'Email is empty !';
      case 'Enter Your Password':
        return 'Password is empty !';
    }
  }
  CustomTextField({@required this.hint , @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        validator: (value){
          if (value.isEmpty) {
            return _errorMessage(hint);
          }
        },
        cursorColor: kMainColor,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(
            icon,
            color: kMainColor,
          ),
          filled: true,
          fillColor: kSecondaryColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: BorderSide(
              color: Colors.white,
            )
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: BorderSide(
              color: Colors.white,
            )
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: BorderSide(
              color: Colors.white,
            )
          ),
        ),
      ),
    );
  }
}