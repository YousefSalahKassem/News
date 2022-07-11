import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../models/news_model.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
  @override
  List<Object> get props =>[];
}
class NewsByCategoryInitState extends CategoryState {}

class NewsByCategoryLoadingState extends CategoryState {}

class NewsByCategoryLoadedState extends CategoryState {
  final List<NewsModel> newsList;
  const NewsByCategoryLoadedState({required this.newsList});
  @override
  List<Object> get props =>[newsList];
}

class NewsByCategoryErrorState extends CategoryState {
  final String errorMessage;
  const NewsByCategoryErrorState({required this.errorMessage});
  @override
  List<Object> get props =>[errorMessage];
}
