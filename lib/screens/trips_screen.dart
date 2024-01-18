import 'package:flutter/material.dart';

import '../models/trip_model.dart';
import '../widgets/trip_item.dart';

class TripsScreen extends StatelessWidget {
  static const screenRoute = '/TripsScreen';

  final List<Trip> availableTrips;

  const TripsScreen(this.availableTrips, {super.key});

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final id = routeArguments['id']!;
    final title = routeArguments['title']!;
    final imageUrl = routeArguments['imageUrl']!;
    final filteredTrips = availableTrips.where((trip) {
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
              id: filteredTrips[index].id,
              title: filteredTrips[index].title,
              imageUrl: filteredTrips[index].imageUrl,
              duration: filteredTrips[index].duration,
              tripType: filteredTrips[index].tripType,
              season: filteredTrips[index].season);
        },
        itemCount: filteredTrips.length,
      ),
    );
  }
}
