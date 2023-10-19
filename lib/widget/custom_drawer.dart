// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:traviling_app/constants.dart';
import 'package:traviling_app/views/filters_view.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: const EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Colors.amber,
            child: Text(
              'دليلك السياحي',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomListTile(
            title: 'الرحلات',
            icon: const Icon(
              Icons.card_travel,
              size: 30,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(kHome);
            },
          ),
          CustomListTile(
            title: 'الفلتلره',
            icon: const Icon(
              Icons.filter_list,
              size: 30,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(FilterView.screenRoute);
            },
          ),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key? key,
    required this.title,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  final String title;
  final Icon icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Amiri',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }
}
