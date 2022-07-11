import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/models/news_model.dart';
import 'package:newsapp/repositories/news_repository.dart';

import 'news_state.dart';

class NewsBloc extends Cubit<NewsState>{
  NewsBloc(): super(NewsInitState());

  Future<void> fetchNews()async{
    emit(NewsLoadingState());
    try {
      final List<NewsModel> newsList=await NewsRepository().getNews();
      emit(NewsLoadedState(newsList: newsList));
    }
    catch(e){
      NewsErrorState(errorMessage: e.toString());
    }
  }

}