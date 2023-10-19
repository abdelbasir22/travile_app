import 'package:flutter/material.dart';
import 'package:traviling_app/constants.dart';
import 'package:traviling_app/models/trip.dart';
import 'package:traviling_app/widget/trip_row.dart';

class TripItem extends StatelessWidget {
  const TripItem({
    super.key,
    required this.title,
    required this.imagrUrl,
    required this.duration,
    required this.tripType,
    required this.season,
    required this.id,
    this.removeItem,
  });
  final String title;
  final String id;
  final String imagrUrl;
  final int duration;
  final TripType tripType;
  final Season season;
  final Function? removeItem;

  String get seasonText {
    switch (season) {
      case Season.winter:
        return 'شتاء';

      case Season.summer:
        return 'صيف';

      case Season.spring:
        return 'ربيع';
      default:
        return 'خريف';
    }
  }

  String get tripTypeText {
    switch (tripType) {
      case TripType.exploration:
        return 'استكشاف';
      case TripType.recovery:
        return 'استشفاء';
      case TripType.therapy:
        return 'معالجه';
      default:
        return 'انشطة';
    }
  }

  void selectTrip(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      kTripDetails,
      arguments: id,
    )
        .then((value) {
      if (value != null) {
        removeItem!(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 7,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.network(
                    imagrUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 250,
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(.8),
                        ],
                        stops: const [
                          .6,
                          1
                        ]),
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TripRow(
                duration: duration,
                seasonText: seasonText,
                tripTypeText: tripTypeText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
