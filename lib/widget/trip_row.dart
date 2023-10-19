import 'package:flutter/material.dart';
import 'package:traviling_app/widget/trip_info.dart';

class TripRow extends StatelessWidget {
  const TripRow({
    super.key,
    required this.duration,
    required this.seasonText,
    required this.tripTypeText,
  });

  final int duration;
  final String seasonText;
  final String tripTypeText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TripInfo(
          icon: Icons.today,
          text: '$duration ايام',
        ),
        TripInfo(
          icon: Icons.sunny,
          text: seasonText,
        ),
        TripInfo(icon: Icons.family_restroom, text: tripTypeText),
      ],
    );
  }
}
