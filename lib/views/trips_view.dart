import 'package:flutter/material.dart';
import 'package:traviling_app/models/trip.dart';
import 'package:traviling_app/widget/trip_item.dart';

class TripsView extends StatefulWidget {
  const TripsView({super.key, this.avaliableTrips});
  static const screenRoute = '/trips';

  final List<Trip>? avaliableTrips;

  @override
  State<TripsView> createState() => _TripsViewState();
}

class _TripsViewState extends State<TripsView> {
  String? categoryTitle;
  List<Trip>? displayTrip;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgioment =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final categoryId = routeArgioment['id'];
    categoryTitle = routeArgioment['title'];
    displayTrip = widget.avaliableTrips?.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removedTrip(String tripId) {
    setState(() {
      displayTrip!.removeWhere((element) => element.id == tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: displayTrip!.length,
        itemBuilder: (context, index) {
          return TripItem(
            title: displayTrip![index].title,
            imagrUrl: displayTrip![index].imageUrl,
            duration: displayTrip![index].duration,
            tripType: displayTrip![index].tripType,
            season: displayTrip![index].season,
            id: displayTrip![index].id,
            // removeItem: _removedTrip,
          );
        },
      ),
    );
  }
}
