import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = "/meal-details";

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title.copyWith(color: Colors.black),
      ),
    );
  }

  Widget buildContainer({Widget child}) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 150,
        width: 350,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;

    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
              height: 300,
              width: double.infinity,
            ),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(selectedMeal.ingredients[index]),
                      ));
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, "Steps"),
            buildContainer(
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(selectedMeal.steps[index]),
                        leading: CircleAvatar(
                          child: Text("# ${index + 1}"),
                        ),
                      ),
                      Divider()
                    ],
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
