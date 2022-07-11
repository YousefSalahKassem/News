import 'package:flutter/material.dart';

import '../components/news_carousel.dart';
import '../components/news_view.dart';
import '../components/select_category.dart';
import '../components/top_bar.dart';
import '../components/welcome_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: Image.asset("assets/images/logo.png",width: 60,),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox(
            width: size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SizedBox(height: 10),
                        WelcomeWidget(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  const NewsCarousel(),
                  const SizedBox(
                    height: 15,
                  ),
                  const CategorySelector(),
                  const SizedBox(height: 5,),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [TiledNewsView()],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
