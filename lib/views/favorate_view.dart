import 'package:flutter/material.dart';
import 'package:traviling_app/models/trip.dart';
import 'package:traviling_app/widget/trip_item.dart';

class FavoriteView extends StatelessWidget {
  final List<Trip> favoirtTrips;

  FavoriteView(this.favoirtTrips);

  @override
  Widget build(BuildContext context) {
    if (favoirtTrips.isEmpty) {
      return const Center(
        child: Text(
          'ليس هناك رحلات مفضلة',
          style: TextStyle(fontSize: 28),
        ),
      );
    } else {
      return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: favoirtTrips.length,
        itemBuilder: (context, index) {
          return TripItem(
            title: favoirtTrips[index].title,
            imagrUrl: favoirtTrips[index].imageUrl,
            duration: favoirtTrips[index].duration,
            tripType: favoirtTrips[index].tripType,
            season: favoirtTrips[index].season,
            id: favoirtTrips[index].id,
            // removeItem: _removedTrip,
          );
        },
      );
    }
  }
}
