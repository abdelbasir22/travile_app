import 'package:flutter/material.dart';
import 'package:traviling_app/app_data.dart';

class TripDetailsView extends StatelessWidget {
  //const TripDetailsView({super.key});

  static const screenRoute = '/trip-details';

  final Function mangeFav;
  final Function isFav;

  TripDetailsView(this.mangeFav, this.isFav);

  Widget buildListViewContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedTrip = tripsData.firstWhere(
      (element) => element.id == tripId,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedTrip.title} '),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedTrip.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            buildSectionTitle(context, 'الانشطة'),
            buildListViewContainer(
              ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: selectedTrip.activities.length,
                itemBuilder: (context, index) => Card(
                  elevation: 0.3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Text(
                      selectedTrip.activities[index],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            buildSectionTitle(context, 'البرنامج اليومي'),
            buildListViewContainer(
              ListView.builder(
                itemCount: selectedTrip.program.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.white,
                        child: Text('يوم ${index + 1}'),
                      ),
                      title: Text(
                        selectedTrip.program[index],
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        child: Icon(
          isFav(tripId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => mangeFav(tripId),
      ),
    );
  }

  Container buildSectionTitle(BuildContext context, String titleText) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      alignment: Alignment.topRight,
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
