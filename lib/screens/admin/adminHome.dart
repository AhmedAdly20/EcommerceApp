import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  static String id = 'AdminHome';
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AdminHomePage'),
      ),
    );
  }
}