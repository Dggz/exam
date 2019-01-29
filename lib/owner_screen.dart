import 'package:exam/add_bike.dart';
import 'package:exam/bike.dart';
import 'package:exam/bike_edit.dart';
import 'package:flutter/material.dart';


class OwnerScreen extends StatelessWidget {
  final List<Bike> bikes;

  OwnerScreen({Key key, this.bikes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bikes'),
      ),
      body: ListView.builder(
          itemCount: bikes.length,
          padding: const EdgeInsets.all(15.0),
          itemBuilder: (context, position) {

            return Column(
              children: <Widget>[
                Divider(height: 5.0),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BikeEditScreen(bike: bikes[position])),
                    );
                  },
                  title: Text(
                    '${bikes[position].name}',
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  subtitle: Text(
                    '${bikes[position].type + ', '
                        + bikes[position].size + ', '
                        + bikes[position].status
                    }',
                    style: new TextStyle(
                      fontSize: 18.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.orange,
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddBikeScreen()),
          );

        },
      ),
    );
  }
}
