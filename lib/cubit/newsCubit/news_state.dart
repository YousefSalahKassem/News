import 'package:equatable/equatable.dart';

import '../../models/news_model.dart';

abstract class NewsState extends Equatable {
  const NewsState();
  @override
  List<Object> get props =>[];
}

class NewsInitState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsLoadedState extends NewsState {
  final List<NewsModel> newsList;
  const NewsLoadedState({required this.newsList});
  @override
  List<Object> get props =>[newsList];
}

class NewsErrorState extends NewsState {
  final String errorMessage;
  const NewsErrorState({required this.errorMessage});
  @override
  List<Object> get props =>[errorMessage];
}

class NewsByCategoryInitState extends NewsState {}

class NewsByCategoryLoadingState extends NewsState {}

class NewsByCategoryLoadedState extends NewsState {
  final List<NewsModel> newsList;
  const NewsByCategoryLoadedState({required this.newsList});
  @override
  List<Object> get props =>[newsList];
}

class NewsByCategoryErrorState extends NewsState {
  final String errorMessage;
  const NewsByCategoryErrorState({required this.errorMessage});
  @override
  List<Object> get props =>[errorMessage];
}

