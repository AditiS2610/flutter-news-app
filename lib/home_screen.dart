import 'package:aditi_news/services.dart';
import 'package:aditi_news/topComponent.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

import 'component2.dart';
import 'component3.dart';
import 'models/news.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // Component 1
            TopComponent(size: size),
            // Component2

            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                "Latest News From Feeds",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            const Component2(),
        SizedBox(height: 15,),



        // Componenet 3

         const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                "Stay Updated With Tech World",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            const Component3(),



          ]),
        ),
      ),
    );
  }
}













