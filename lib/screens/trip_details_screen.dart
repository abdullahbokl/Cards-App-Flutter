import 'package:cards/category_data.dart';
import 'package:flutter/material.dart';

class TripDetailScreen extends StatelessWidget {
  static const screenRoute = '/TripDetailScreen';

  final Function changeFavourits;
  final Function _isFavourit;
  TripDetailScreen(this.changeFavourits, this._isFavourit);

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  Widget buildListViewController(Widget child) {
    return Container(
      height: 200,
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(cornerRadius),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final selectedTrip = Trips_data.firstWhere((trip) => id == trip.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedTrip.title),
      ),
      body: SingleChildScrollView(
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
            buildSectionTitle(context, 'Activities'),
            buildListViewController(
              ListView.builder(
                itemCount: selectedTrip.activities.length,
                itemBuilder: (context, index) => Card(
                  elevation: 0.3,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectedTrip.activities[index]),
                  ),
                ),
              ),
            ),
            buildSectionTitle(context, 'Daily Program'),
            buildListViewController(
              ListView.builder(
                itemCount: selectedTrip.program.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          'day ${index+1}',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      title: Text(selectedTrip.program[index]),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
            _isFavourit(id) ? Icons.star : Icons.star_border,
        ),
        onPressed: (){
          changeFavourits(id);
        },
      ),
    );
  }
}
