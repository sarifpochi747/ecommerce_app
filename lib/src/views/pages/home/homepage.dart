// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SizedBox(
        height: MediaQuery.of(context).size.height*(2/5),
        child: Stack(
          children: <Widget>[
            // Background Image
            Container(
              color: Colors.black,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Athelic Shoes",
                      style: TextStyle(color: Colors.white,fontSize: 42,fontWeight: FontWeight.bold)
                    ),
                    Text("Collection",
                      style: TextStyle(color: Colors.white,fontSize: 42,fontWeight: FontWeight.bold)
                
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        
      )
    );
  }
}