// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(
          "Login Page",
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
        ),
      ),
    );
  }
}