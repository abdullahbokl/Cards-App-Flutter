import 'package:cards/screens/app_drawer.dart';
import 'package:flutter/material.dart';

import '../models/trip_model.dart';
import 'categories_screen.dart';
import 'favourites_screen.dart';

class TabBarScreen extends StatefulWidget {
  final List<Trip> favouriteTrips;

  const TabBarScreen(this.favouriteTrips, {super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  int _selectedIndex = 0;

  List<Map<String, Object>> _screens = [];

  @override
  void initState() {
    _screens = [
      {
        'Screen': const CategoriesScreen(),
        'Title': 'Home',
      },
      {
        'Screen': FavouritesScreen(widget.favouriteTrips),
        'Title': 'Favourites',
      },
    ];
    super.initState();
  }

  void _onItemTapped(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedIndex]['Title'] as String),
      ),
      body: _screens[_selectedIndex]['Screen'] as Widget,
      drawer: const AppDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
            backgroundColor: Colors.pink,
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
