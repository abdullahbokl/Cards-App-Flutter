import 'package:cards/category_data.dart';
import 'package:cards/core/app_theme.dart';
import 'package:flutter/material.dart';

import '../screens/filter_screen.dart';
import '../screens/tab_bar_screen.dart';
import '../screens/trip_details_screen.dart';
import '../screens/trips_screen.dart';
import 'models/trip_model.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };

  List<Trip> availableTrips = tripsData;
  List<Trip> favouriteTrips = [];

  void _changeFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      availableTrips = tripsData.where((trip) {
        if (_filters['summer'] == true && trip.isInSummer == true) {
          return false;
        }
        if (_filters['winter'] == true && trip.isInWinter == true) {
          return false;
        }
        if (_filters['family'] == true && trip.isForFamilies == true) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  bool _isFavourite(String tripId) {
    return favouriteTrips.any((trip) => trip.id == tripId);
  }

  void _changeFavourites(String tripId) {
    var idx = favouriteTrips.indexWhere((trip) => tripId == trip.id);

    setState(() {
      if (idx >= 0) {
        favouriteTrips.removeAt(idx);
      } else {
        idx = tripsData.indexWhere((trip) => trip.id == tripId);
        favouriteTrips.add(tripsData[idx]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cards',
      routes: _routes(),
      theme: AppTheme.themeData,
    );
  }

  Map<String, WidgetBuilder> _routes() {
    return {
      '/': (context) => TabBarScreen(favouriteTrips),
      TripsScreen.screenRoute: (context) => TripsScreen(availableTrips),
      TripDetailScreen.screenRoute: (context) =>
          TripDetailScreen(_changeFavourites, _isFavourite),
      FilterScreen.screenRoute: (context) =>
          FilterScreen(_filters, _changeFilters),
    };
  }
}
