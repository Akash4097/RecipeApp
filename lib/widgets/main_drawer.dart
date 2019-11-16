import 'package:flutter/material.dart';

import '../screens/settings_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      onTap: tapHandler,
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 22, fontFamily: "RobotoCondensed"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: "RobotoCondensed",
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
            ),
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            alignment: Alignment.centerLeft,
          ),
          SizedBox(
            height: 30,
          ),
          buildListTile("Meals", Icons.restaurant, () {
            Navigator.of(context).pushNamed("/");
          }),
          buildListTile("Settings", Icons.settings, () {
            Navigator.of(context).pushNamed(SettingsScreen.routeName);
          })
        ],
      ),
    );
  }
}
