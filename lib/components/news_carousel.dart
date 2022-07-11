import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/newsCubit/news_bloc.dart';
import '../cubit/newsCubit/news_state.dart';
import '../views/news_view_screen.dart';

class NewsCarousel extends StatelessWidget {
  const NewsCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return BlocBuilder<NewsBloc,NewsState>(
        builder: (BuildContext context, NewsState state){
          if(state is NewsInitState){
            context.read<NewsBloc>().fetchNews();
          }
          if(state is NewsLoadingState){
            return const Center(child: CircularProgressIndicator(),);
          }
          else if (state is NewsLoadedState){

            return CarouselSlider(
              options: CarouselOptions(
                height: 250.0,
                autoPlay: true
              ),
              items: state.newsList.map((news) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsViewPage(newsPost: news)));
                      },
                      child:  Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(news.urlToImage!),
                                height: 250,
                                // width: MediaQuery.of(context).size.width,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child:Container(
                                alignment: Alignment.bottomCenter,
                                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                width: MediaQuery.of(context).size.width,
                                height: 100,
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.black45,
                                        Colors.black45,
                                        Colors.black45,
                                        Colors.black45,
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  news.title!,
                                  maxLines: 3,
                                  style: const TextStyle(fontSize: 15, color: Colors.white),
                                ),
                              ),

                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            );
          }
          else if (state is NewsErrorState){
            return Center(child: Text(state.errorMessage));
          }
          else{
            return const Center(child: Text("no data found"));
          }
        }
    ) ;

  }
}