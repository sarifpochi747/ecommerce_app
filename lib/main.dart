// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_app/src/Provider/mian_screen_provider.dart';
import 'package:flutter/material.dart';
import 'src/app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( 
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> MainScreenNotifier())
      ],
      child: MaterialApp(
        home: MyApp(),
      ),
    )
  );
}


