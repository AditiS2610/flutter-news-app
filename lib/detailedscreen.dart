import 'package:aditi_news/models/news.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailedScreen extends StatelessWidget {
  DetailedScreen({super.key, required this.article});
  Article article;
Future<void> _launchUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(35.0),
                    bottomRight: Radius.circular(35.0),
                  ),
                  child: Image.network(
                    article.urlToImage ?? "",
                    fit: BoxFit.cover,
                    height: size.height * 0.5,
                    width: size.width,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        height: size.height * 0.5,
                        width: size.width,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(35.0),
                            bottomRight: Radius.circular(35.0),
                          ),
                          color: Colors.grey,
                        ),
                        child: const Center(
                            child: CircularProgressIndicator(
                          color: Colors.black,
                        )),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: size.height * 0.5,
                        width: size.width,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(35.0),
                            bottomRight: Radius.circular(35.0),
                          ),
                          color: Colors.grey,
                        ),
                        child: const Center(
                            child: Icon(
                          Icons.error,
                          color: Colors.black,
                          size: 100,
                        )),
                      );
                    },
                  )),
  GestureDetector(
    onTap: () {
      if(Navigator.canPop(context)){
        Navigator.pop(context);
      }
    },
    child: Container(
      margin: const EdgeInsets.only(left: 20,top: 40),
      width: size.width*0.15,
      height: size.width*0.15,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        shape: BoxShape.circle
      ),
      child: const Icon(Icons.arrow_back,color: Colors.white,),
    ),
  )


            ],
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
                  article.title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
          ),
          const Divider(),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                      "Published At: ${article.publishedAt.toString()}",
                      style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    ),
            ),
          ),

 Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                      "Article By: ${article.author.toString()}",
                      style: const TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    ),
            ),
          ),
const Divider(),

Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
article.description,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                
                onPressed: (){
            _launchUrl(article.url);
              }, child: const Center(
                child: Text(
                    "View Full News",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
              ),),
            ),
        ]),
      ),
    );
  }
}
