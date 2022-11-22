import 'package:cards/screens/categories_screen.dart';
import 'package:flutter/material.dart';

import 'filter_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  Widget buildListTile({
    required BuildContext context,
    required String title,
    required Icon icon,
    required VoidCallback? onTapLink,
  }) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      onTap: onTapLink,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            color: Theme.of(context).colorScheme.primary,
            child: DrawerHeader(
              child: Center(
                  child: Text(
                'Dashboard',
                style: Theme.of(context).textTheme.headline6,
              )),
            ),
          ),
          buildListTile(
              context: context,
              title: 'Home',
              icon: Icon(Icons.card_travel),
              onTapLink: () {
                Navigator.of(context).pushReplacementNamed('/');
              }),
          buildListTile(
              context: context,
              title: 'Filter',
              icon: Icon(Icons.filter),
              onTapLink: () {
                Navigator.of(context).pushReplacementNamed(FilterScreen.screenRoute);
              }),
        ],
      ),
    );
  }
}
