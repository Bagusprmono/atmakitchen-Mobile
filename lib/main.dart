import 'package:atmakitchen/view/auth/login.dart';
import 'package:atmakitchen/view/editProfileView.dart';
import 'package:atmakitchen/view/navbarCustomer.dart';
import 'package:flutter/material.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
