import 'package:flutter/material.dart';

import '../models/trip_model.dart';
import '../widgets/trip_item.dart';

class FavouritesScreen extends StatefulWidget {
  static const screenRoute = '/FavouritesScreen';

  final List<Trip> favouriteTrips;

  const FavouritesScreen(this.favouriteTrips, {super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favouriteTrips.isEmpty) {
      return Center(
        child: ElevatedButton(
            onPressed: () {
              for (var element in widget.favouriteTrips) {
                debugPrint(element.title);
              }
            },
            child: const Text('Add trips')),
      );
    } else {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return TripItem(
            id: widget.favouriteTrips[index].id,
            title: widget.favouriteTrips[index].title,
            imageUrl: widget.favouriteTrips[index].imageUrl,
            duration: widget.favouriteTrips[index].duration,
            tripType: widget.favouriteTrips[index].tripType,
            season: widget.favouriteTrips[index].season,
          );
        },
        itemCount: widget.favouriteTrips.length,
      );
    }
  }
}
