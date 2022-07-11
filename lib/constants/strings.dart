import '../models/category_model.dart';

const String url = "https://newsapi.org/v2/top-headlines?apiKey=7deabb9d926d45c48ae4d0e761cf3271&country=us";
const String category ="&category=";
const String appName="News";

List<Category> categories=[
  Category(name: "general"),
  Category(name: "business"),
  Category(name: "entertainment"),
  Category(name: "health"),
  Category(name: "science"),
  Category(name: "sports"),
  Category(name: "technology"),
];