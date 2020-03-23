import 'package:flutter/material.dart';

import '../data/dummy_data.dart';

class CategoriesMealsScreen extends StatelessWidget {
  static const routeName = 'category-meals';
  @override
  Widget build(BuildContext context) {
    final Map<String, String> routesArg =
        ModalRoute.of(context).settings.arguments;
    final String categoryId = routesArg['id'];
    final String categoryTitle = routesArg['title'];

    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Text(categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
