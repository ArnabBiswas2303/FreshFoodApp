import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoriesMealsScreen extends StatefulWidget {
  static const routeName = 'category-meals';
  final List<Meal> availMeals;
  CategoriesMealsScreen(this.availMeals);

  @override
  _CategoriesMealsScreenState createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
  var _hasInitialized = false;
  String categoryTitle;
  String categoryId;
  List<Meal> displayedMeals;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_hasInitialized) {
      final Map<String, String> routesArg =
          ModalRoute.of(context).settings.arguments;
      categoryId = routesArg['id'];
      categoryTitle = routesArg['title'];
      displayedMeals = widget.availMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _hasInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    void _removeMealItem(String id) {
      setState(() {
        displayedMeals.removeWhere(
          (meal) => meal.id == id,
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("categoryTitle"),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealIteam(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            removeMealItem: _removeMealItem,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
