import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/categoryCubit/category_bloc.dart';
import 'package:newsapp/cubit/categoryCubit/category_state.dart';
import 'package:newsapp/views/news_view_screen.dart';
import 'package:timeago/timeago.dart' as timeago;

class TiledNewsView extends StatelessWidget {
  const TiledNewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryBloc,CategoryState>(
        listener: (context,state){},
        builder: (BuildContext context, CategoryState state){
          if(state is NewsByCategoryInitState){
            context.read<CategoryBloc>().fetchNewsByCategory("business");
          }
          if (state is NewsByCategoryLoadingState){
            return const CircularProgressIndicator();
          }
          else if (state is NewsByCategoryLoadedState){

            return SizedBox(
                height: 300,
                child: ListView.builder(
                    itemCount: state.newsList.length,
                    itemBuilder: (context,index){
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsViewPage(newsPost: state.newsList[index])));
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  state.newsList[index].urlToImage!,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      getTruncatedTitle(state.newsList[index].title!, 60),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Text(
                                        //   "${newsDescriptionLength >= 200 ? (newsDescriptionLength / 200).floor() : (newsDescriptionLength / 200 * 60).floor()} ${newsDescriptionLength >= 200 ? "mins" : "secs"} read",
                                        //   style: TextStyle(
                                        //       fontSize: 13, color: Colors.grey[700]),
                                        // ),
                                        Text(
                                          timeago.format(DateTime.parse(state.newsList[index].publishedAt!)),
                                          style: TextStyle(
                                              fontSize: 13, color: Colors.grey[700]),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }));
          }
          else if (state is NewsByCategoryErrorState){
            return Center(child: Text(state.errorMessage));
          }
          else {
            return const Center(child: Text("No data found"));
          }
        }
    );
  }

  String getTruncatedTitle(String actualString, int maxLetters) {
    return actualString.length > maxLetters
        ? "${actualString.substring(0, maxLetters)}..."
        : actualString;
  }
}