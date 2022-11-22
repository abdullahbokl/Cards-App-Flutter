import 'package:flutter/material.dart';

import '../models/trip_model.dart';
import '../widgets/trip_item.dart';

class FavouritsScreen extends StatefulWidget {
  static const screenRoute = '/FavouritsScreen';

  final List<Trip> favouritTrips;

  FavouritsScreen(this.favouritTrips);

  @override
  State<FavouritsScreen> createState() => _FavouritsScreenState();
}

class _FavouritsScreenState extends State<FavouritsScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favouritTrips.isEmpty) {
      return Center(
        child: ElevatedButton(
            onPressed: () {
              widget.favouritTrips.forEach((element) {
                print(element.title);
              });
            },
            child: Text('Add trips')),
      );
    } else {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return TripItem(
              id: widget.favouritTrips[index].id,
              title: widget.favouritTrips[index].title,
              imageUrl: widget.favouritTrips[index].imageUrl,
              duration: widget.favouritTrips[index].duration,
              tripType: widget.favouritTrips[index].tripType,
              season: widget.favouritTrips[index].season);
        },
        itemCount: widget.favouritTrips.length,
      );
    }
  }
}
