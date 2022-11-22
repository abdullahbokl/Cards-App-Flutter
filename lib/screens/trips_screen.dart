import 'package:cards/category_data.dart';
import 'package:cards/widgets/trip_item.dart';
import 'package:flutter/material.dart';

import '../models/trip_model.dart';

class TripsScreen extends StatelessWidget {
  static const screenRoute = '/TripsScreen';

  final List<Trip> availableTrips;

  TripsScreen(this.availableTrips);


  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final id = routeArguments['id']!;
    final title = routeArguments['title']!;
    final imageUrl = routeArguments['imageUrl']!;
    final filterdTrips = availableTrips.where((trip) {
      return trip.categories.contains(id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TripItem(
              id: filterdTrips[index].id,
              title: filterdTrips[index].title,
              imageUrl: filterdTrips[index].imageUrl,
              duration: filterdTrips[index].duration,
              tripType: filterdTrips[index].tripType,
              season: filterdTrips[index].season);
        },
        itemCount: filterdTrips.length,
      ),
    );
  }
}
