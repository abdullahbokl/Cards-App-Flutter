import 'package:cards/screens/app_drawer.dart';
import 'package:flutter/material.dart';

import '../models/trip_model.dart';
import 'categories_screen.dart';
import 'favourits_screen.dart';
//
// import 'categories_screen.dart';
// import 'favourits_screen.dart';
//
// class TabBarScreen extends StatelessWidget {
//   const TabBarScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Cards'),
//           bottom: const TabBar(
//               tabs: [
//                 Tab(
//                   text: 'Categories',
//                   icon: Icon(Icons.dashboard),
//                 ),
//                 Tab(
//                   text: 'Favourits',
//                   icon: Icon(Icons.favorite),
//                 ),
//               ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             CategoriesScreen(),
//             FavouritsScreen(),
//           ],
//         ),
//       ),
//     );
//   }
// }

class TabBarScreen extends StatefulWidget {

  final List<Trip> favouritTrips;

  TabBarScreen(this.favouritTrips);

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
        'Screen': CategoriesScreen(),
        'Title': 'Home',
      },
      {
        'Screen': FavouritsScreen(widget.favouritTrips),
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
      drawer: AppDrawer(),
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
