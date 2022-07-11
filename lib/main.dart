import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/categoryCubit/category_bloc.dart';
import 'package:newsapp/repositories/news_repository.dart';
import 'package:newsapp/views/home_screen.dart';
import 'cubit/newsCubit/news_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<NewsBloc>(
            create: (context) => NewsBloc(),
          ),
          BlocProvider<CategoryBloc>(
            create: (context) => CategoryBloc(),
          )
        ],
        child: MaterialApp(
          title: 'News App',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          theme: ThemeData(
            fontFamily: "Open Sans",
            primarySwatch: Colors.blue,
          ),
          home: const HomeScreen(),
        ));
  }
}
