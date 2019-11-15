import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = '/category_meals';

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final String categoryId = arguments["id"];
    final String categoryTitle = arguments["title"];
    final filteredCategoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
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
