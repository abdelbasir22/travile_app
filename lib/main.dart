import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:traviling_app/app_data.dart';
import 'package:traviling_app/models/trip.dart';
import 'package:traviling_app/views/trip_details_view.dart';
import 'package:traviling_app/views/filters_view.dart';
import 'package:traviling_app/views/tabs_view.dart';
import 'package:traviling_app/views/trips_view.dart';

void main() {
  runApp(const TravilApp());
}

class TravilApp extends StatefulWidget {
  const TravilApp({super.key});

  @override
  State<TravilApp> createState() => _TravilAppState();
}

class _TravilAppState extends State<TravilApp> {
  Map<String, bool> _filtres = {
    'summer': false,
    'winter': false,
    'famliy': false,
  };
  List<Trip> _avilableTrips = tripsData;
  List<Trip> _favoritTrips = [];

  void _changeFiltre(Map<String, bool> filterData) {
    setState(() {
      _filtres = filterData;

      _avilableTrips = tripsData.where(
        (element) {
          if (_filtres['summer'] == true && element.isInSummer != true) {
            return false;
          }
          if (_filtres['winter'] == true && element.isInWinter != true) {
            return false;
          }
          if (_filtres['famliy'] == true && element.isForFamilies != true) {
            return false;
          }
          return true;
        },
      ).toList();
    });
  }

  void _mangeFav(String tripId) {
    final indexTrue =
        _favoritTrips.indexWhere((element) => element.id == tripId);
    if (indexTrue >= 0) {
      setState(
        () {
          _favoritTrips.removeAt(indexTrue);
        },
      );
    } else {
      setState(() {
        _favoritTrips
            .add(tripsData.firstWhere((element) => element.id == tripId));
      });
    }
  }

  bool _isFav(String id) {
    return _favoritTrips.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ar', 'EG')],
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        fontFamily: 'ElMessiri',
        textTheme: ThemeData.light().textTheme.copyWith(
              headlineSmall: const TextStyle(
                color: Colors.blue,
                fontSize: 24,
                fontFamily: 'ElMessiri',
                fontWeight: FontWeight.bold,
              ),
              titleLarge: const TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontFamily: 'ElMessiri',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Travil App',
      // home: const TabsView (),
      initialRoute: '/',
      routes: {
        //kTrip: (context) => const TripsView(),
        '/': (context) => TabsView(_favoritTrips),
        TripsView.screenRoute: (context) => TripsView(
              avaliableTrips: _avilableTrips,
            ),
        TripDetailsView.screenRoute: (context) =>
            TripDetailsView(_mangeFav, _isFav),
        // kTripDetails: (context) => const TripDetailsView(),
        FilterView.screenRoute: (context) =>
            FilterView(_filtres, _changeFiltre),
      },
    );
  }
}
