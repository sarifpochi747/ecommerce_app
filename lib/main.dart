// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_app/src/Routers/routers.dart';
import 'package:ecommerce_app/src/services/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'src/app.dart';



Future<void> main() async {
  init();
  runApp( 
    GetMaterialApp(
      home: MyApp(),
      initialRoute: Routers.initial,
      getPages: Routers.routers,
    )
  );
}


