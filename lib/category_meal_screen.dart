import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
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
        body: Center(child: Text("The Recipes For the Category")));
  }
}
