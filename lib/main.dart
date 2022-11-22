import 'package:cards/category_data.dart';
import 'package:flutter/material.dart';
import '../screens/tab_bar_screen.dart';
import '../screens/favourits_screen.dart';
import '../screens/categories_screen.dart';
import '../screens/trips_screen.dart';
import '../screens/trip_details_screen.dart';
import '../screens/filter_screen.dart';
import 'models/trip_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _fliters = {
    'summer': false,
    'winter': false,
    'family': false,
  };

  List<Trip> availableTrips = Trips_data;
  List<Trip> favouritTrips = [];

  void _changeFilters(Map<String, bool> filterData) {
    setState(() {
      _fliters = filterData;
      availableTrips = Trips_data.where((trip) {
        if (_fliters['summer'] == true && trip.isInSummer == true) {
          return false;
        }
        if (_fliters['winter'] == true && trip.isInWinter == true) {
          return false;
        }
        if (_fliters['family'] == true && trip.isForFamilies == true) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  bool _isFavourit (String tripId) {
    return favouritTrips.any((trip) => trip.id == tripId);
  }


  void _changeFavourits(String tripId) {
    var idx = favouritTrips.indexWhere((trip) => tripId == trip.id);

    setState(() {
      if (idx >= 0) {
        favouritTrips.removeAt(idx);
      } else {
        idx = Trips_data.indexWhere((trip) => trip.id == tripId);
        favouritTrips.add(Trips_data[idx]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cards',
      routes: {
        '/': (context) => TabBarScreen(favouritTrips),
        TripsScreen.screenRoute: (context) => TripsScreen(availableTrips),
        TripDetailScreen.screenRoute: (context) => TripDetailScreen(_changeFavourits, _isFavourit),
        FilterScreen.screenRoute: (context) => FilterScreen(_fliters, _changeFilters),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.amber),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline5: const TextStyle(
                color: Colors.blue,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              headline6: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
    );
  }
}
