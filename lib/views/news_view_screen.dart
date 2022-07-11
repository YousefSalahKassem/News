import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../models/news_model.dart';

class NewsViewPage extends StatelessWidget {
  final NewsModel newsPost;
  const NewsViewPage({Key? key, required this.newsPost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
          width: size.width,
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              ClipRRect(
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(newsPost.urlToImage!),
                  height: size.height,
                  width: size.width,
                ),
              ),
              Container(
                width: size.width,
                height: size.height,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      // const Color(0xCC000000),
                      Color(0x00000000),
                      Color(0x00000000),
                      Color(0xCC000000),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(top: 30, left: 10),
                    child: const Icon(
                      Icons.arrow_back,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                // alignment: Alignment.bottomCenter,
                child: Container(
                  width: size.width,
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        newsPost.title!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    newsPost.source!.name!,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    timeago.format(DateTime.parse( newsPost.publishedAt!)),
                                    style: TextStyle(color: Colors.grey[400]),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 40),
                            child: Row(
                              children: const[
                                Icon(
                                  Icons.bookmark_outlined,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Icon(
                                  Icons.share,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        margin: const EdgeInsets.only(top: 10, right: 40),
                        height: 3,
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        margin: const EdgeInsets.only(top: 10, right: 40),
                        child: Text(newsPost.content!,
                            style: const TextStyle(
                              color: Colors.white,
                            )),
                      ),
                      const SizedBox(height: 20,),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}