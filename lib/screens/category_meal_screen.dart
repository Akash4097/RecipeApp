import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = '/category_meals';

  final List<Meal> _availableMeal;

  CategoryMealScreen(this._availableMeal);

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final String categoryId = arguments["id"];
    final String categoryTitle = arguments["title"];
    final filteredCategoryMeals = _availableMeal.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: filteredCategoryMeals[index].id,
            title: filteredCategoryMeals[index].title,
            duration: filteredCategoryMeals[index].duration,
            imageUrl: filteredCategoryMeals[index].imageUrl,
            affordability: filteredCategoryMeals[index].affordability,
            complexity: filteredCategoryMeals[index].complexity,
          );
        },
        itemCount: filteredCategoryMeals.length,
      ),
    );
  }
}
