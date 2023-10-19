// import 'package:flutter/material.dart';
// import 'package:traviling_app/views/category_view.dart';
// import 'package:traviling_app/views/favorate_view.dart';

// class TabsView extends StatelessWidget {
//   const TabsView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           title: const Center(child: Text('سواح')),
//           bottom: const TabBar(
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.dashboard),
//                 text: 'التصنيفات',
//               ),
//               Tab(
//                 icon: Icon(Icons.star),
//                 text: 'الرحلات المفضله',
//               ),
//             ],
//           ),
//         ),
//         body: const TabBarView(
//           children: [
//             CategoryView(),
//             FavoriteView(),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:traviling_app/models/trip.dart';
import 'package:traviling_app/views/category_view.dart';
import 'package:traviling_app/views/favorate_view.dart';
import 'package:traviling_app/widget/custom_drawer.dart';

class TabsView extends StatefulWidget {
  final List<Trip> favoirtTrips;

  TabsView(this.favoirtTrips);

  @override
  State<TabsView> createState() => _TabsViewState();
}

class _TabsViewState extends State<TabsView> {
  int _selectedIndex = 0;

  List<Map<String, dynamic>>? _views;

  @override
  void initState() {
    _views = [
      {
        'View': const CategoryView(),
        'Title': 'سواح',
      },
      {
        'View': FavoriteView(widget.favoirtTrips),
        'Title': 'الرحلات المفضله',
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text(_views?[_selectedIndex]['Title']),
        ),
      ),
      drawer: const AppDrawer(),
      body: _views?[_selectedIndex]['View'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'التصنيفات'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'المفضله'),
        ],
      ),
    );
  }
}
