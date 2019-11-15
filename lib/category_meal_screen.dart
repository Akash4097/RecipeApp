import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = '/category_meals';

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final String categoryId = arguments["id"];
    final String categoryTitle = arguments["title"];

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {},
      ),
    );
  }
}
