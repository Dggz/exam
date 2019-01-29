
import 'package:exam/bike.dart';
import 'package:exam/bike_preview.dart';
import 'package:exam/bike_view.dart';
import 'package:exam/song_view.dart';
import 'package:flutter/material.dart';


class RentScreen extends StatelessWidget {
  final List<Bike> bikes;

  RentScreen({Key key, this.bikes}) : super(key: key);

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
                      MaterialPageRoute(builder: (context) => BikePreviewScreen(bike: bikes[position])),
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
                    '${bikes[position].size + ', ' + bikes[position].type
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
    );
  }
}
