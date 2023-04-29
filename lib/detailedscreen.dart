import 'package:aditi_news/models/news.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DetailedScreen extends StatelessWidget {
   DetailedScreen({super.key,required this.article});
Article article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Text(
        article.title,
        style: TextStyle(color: Colors.black),
      )),
    );
  }
}