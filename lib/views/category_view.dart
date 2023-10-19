import 'package:flutter/material.dart';
import 'package:traviling_app/app_data.dart';
import 'package:traviling_app/widget/category_item.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   title: const Center(child: Text('سواح')),
      // ),
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 7 / 8,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        children: categoriesData
            .map(
              (e) => CategoryItem(
                title: e.title,
                image: e.image,
                id: e.id,
              ),
            )
            .toList(),
      ),
    );
  }
}
