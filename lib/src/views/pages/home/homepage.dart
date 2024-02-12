// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  late final TabController _tabController = TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            // Background Image
            Container(
              height: MediaQuery.of(context).size.height*(2/4),
              padding: (EdgeInsets.fromLTRB(16,40,0,0)),
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
                    TabBar(
                      indicatorColor: Colors.black,
                      isScrollable: true,
                      controller: _tabController,
                      labelStyle: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),
                      unselectedLabelColor: Colors.grey.withOpacity(0.6),
                      tabs: const[
                        Tab(text: "Men Shoes",),
                        Tab(text: "Women Shoes",),
                        Tab(text: "Kids Shoes",),
                      ]
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.265),
              child: Padding(
                padding: const EdgeInsets.only(left:12.0),
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    //Men Shoes
                    Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.4,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.all(Radius.circular(16))
                                  ),
                                  width: MediaQuery.of(context).size.width*0.6,
                                  height: MediaQuery.of(context).size.height,
                                ),
                              );
                            },
                          ),
                        ),
                    
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              
                              children: [
                                Text("Latest Shoes",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                                Text("Show All",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                              ],
                            ),
                            SizedBox(
                              height: 10
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height*0.14,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 6,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(16)
                                      ),
                                      height: MediaQuery.of(context).size.height,
                                      width: MediaQuery.of(context).size.width*0.3,
                                      
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    //Women Shoes
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height*0.405,
                          color: Colors.green,
                        )
                      ],
                    ),
                    //Kid shoes
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height*0.405,
                          color: Colors.red,
                        )
                      ],
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