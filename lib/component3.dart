
import 'package:aditi_news/detailedscreen.dart';
import 'package:aditi_news/services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

import 'models/news.dart';

class Component3 extends StatefulWidget {
  const Component3({super.key});

  @override
  State<Component3> createState() => _Component3State();
}

class _Component3State extends State<Component3> {
  late News news;
  bool isLoading = true;
  Logger logger = Logger();
  fetchData() async {
    Response response =
        await WebServices.fetchLatestNews(searchKey: "techcrunch");

    if (response.statusCode == 200) {
      //  response is fetched successfully

      news = NewsFromJson(response.body);
      setState(() {
        isLoading = false;
      });
    } else {
      logger.log(Level.error,
          "failed to load data and status code was ${response.statusCode}");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return isLoading
        ? Container(
            width: size.width,
            height: size.width * 0.7,
            child: const Center(
                child: CircularProgressIndicator(
              color: Colors.black,
            )),
          )
        : Container(
            margin: EdgeInsets.all(20.0),
            width: size.width,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: news.articles.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailedScreen(article: news.articles[index]),));
                  },
                  child: Container(
                    width: size.width,
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4.0,
                          )
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image
                        ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              bottomLeft: Radius.circular(15.0),
                            ),
                            child: Image.network(
                              news.articles[index].urlToImage ?? "",
                              fit: BoxFit.cover,
                              height: size.width * 0.3,
                              width: size.width * 0.3,
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Container(
                                  height: size.width * 0.3,
                                  width: size.width * 0.3,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15.0),
                                      bottomLeft: Radius.circular(15.0),
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
                                  height: size.width * 0.3,
                                  width: size.width * 0.3,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15.0),
                                      bottomLeft: Radius.circular(15.0),
                                    ),
                                    color: Colors.grey,
                                  ),
                                  child: const Center(
                                      child: Icon(
                                    Icons.error,
                                    color: Colors.black,
                                    size: 50,
                                  )),
                                );
                              },
                            )),
                
                        Expanded(
                          child: SizedBox(
                            height: size.width*0.25,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Title
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5.0, top: 7.0),
                                  child: Text(
                                    news.articles[index].title,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                          
                          
                                // description
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5.0, top: 7.0),
                                  child: Text(
                                    news.articles[index].description,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 10),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                          
                                //Author
                          
                                SizedBox(
                                  width: double.maxFinite,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 7.0, right: 7.0),
                                      child: Text(
                                        "-- ${news.articles[index].author}",
                                        style: const TextStyle(
                                            color: Colors.purple,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 10),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
  }
}
