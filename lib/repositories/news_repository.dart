import 'package:dio/dio.dart';
import 'package:newsapp/constants/strings.dart';
import 'package:newsapp/models/news_model.dart';

class NewsRepository{
  final Dio _dio=Dio();

  Future<List<NewsModel>> getNews() async {
    try {
      final response = await _dio.get(url);
      var news = response.data["articles"] as List;
      List<NewsModel> newsList = news.map((article) => NewsModel.fromJson(article)).toList();
      return newsList;
    }
    catch(error,stacktrace) {
      throw  Exception('Exception happened $error with stacktrace: $stacktrace');
    }
  }

  Future<List<NewsModel>> getNewsByCategory( String query ) async {
    try {
      final response = await _dio.get(url+category+query);
      var news = response.data["articles"] as List;
      List<NewsModel> newsList = news.map((article) => NewsModel.fromJson(article)).toList();
      return newsList;
    }
    catch(error,stacktrace) {
      throw  Exception('Exception happened $error with stacktrace: $stacktrace');
    }
  }
}