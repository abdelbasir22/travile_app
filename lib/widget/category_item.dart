import 'package:flutter/material.dart';
import 'package:traviling_app/constants.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key, required this.title, required this.image, required this.id});

  final String title;
  final String image;
  final String id;

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      kTrip,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              image,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.black.withOpacity(0.4),
            ),
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ],
      ),
    );
  }
}
