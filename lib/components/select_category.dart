import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/categoryCubit/category_bloc.dart';
import '../constants/strings.dart';
import '../cubit/newsCubit/news_bloc.dart';
import '../cubit/newsCubit/news_state.dart';
import '../models/category_model.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({Key? key}) : super(key: key);

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10,top: 15),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: List.generate(categories.length, (index) {
              Category category = categories[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = index;
                    context.read<CategoryBloc>().fetchNewsByCategory(categories[currentIndex].name);
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: currentIndex == index ? Colors.black : Colors.white
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  child: Text(
                    category.name,
                    style: TextStyle(
                        fontSize: 15,
                        color: currentIndex == index ? Colors.white : Colors.black
                    ),
                  ),
                ),
              );
            })),
      ),
    );

  }
}


// class CategorySelector extends StatelessWidget {
//   const CategorySelector({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
