import 'package:flutter/material.dart';

class TripInfo extends StatelessWidget {
  const TripInfo({
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.amber,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(text),
      ],
    );
  }
}
