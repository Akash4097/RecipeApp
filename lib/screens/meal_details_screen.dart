import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = "/meal-details";

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(argument),
      ),
      body: Center(
        child: Text("The meals $argument"),
      ),
    );
  }
}
