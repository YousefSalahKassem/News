import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/categoryCubit/category_state.dart';
import '../../models/news_model.dart';
import '../../repositories/news_repository.dart';

class CategoryBloc extends Cubit<CategoryState>{
  CategoryBloc(): super(NewsByCategoryInitState());

  int currentIndex =0;


  Future<void> fetchNewsByCategory( String query)async{
    emit(NewsByCategoryLoadingState());
    try {
      final List<NewsModel> newsList=await NewsRepository().getNewsByCategory(query);
      emit(NewsByCategoryLoadedState(newsList: newsList));
    }
    catch(e){
      emit(NewsByCategoryErrorState(errorMessage: e.toString()));
    }
  }

}