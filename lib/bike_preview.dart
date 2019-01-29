import 'dart:convert';

import 'package:exam/bike.dart';
import 'package:exam/bike_view.dart';
import 'package:exam/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BikePreviewScreen extends StatelessWidget {
  final Bike bike;

  BikePreviewScreen({Key key, this.bike}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Do you want to rent ${bike.name}?"),
      ),

      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: <Widget>[
          Text("Name: " +
              "${bike.name}",
            style:  new TextStyle(
              fontSize: 18.0,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text("Type: " +
              "${bike.type}",
            style:  new TextStyle(
              fontSize: 18.0,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text("Size: " +
              "${bike.size}",
            style:  new TextStyle(
              fontSize: 18.0,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
        backgroundColor: Colors.green,
        onPressed: () async {
          final String id = bike.id.toString();
          final bikeJson = {
            'id': id,
            'name': bike.name,
            'type': bike.type,
            'size': bike.size,
            'owner': bike.owner,
            'status': bike.status
          };
          final loan_response = await http.post(globalURL()  + '/loan', body: bikeJson);
          final bike_resp = json.decode(loan_response.body);
          Bike new_bike = Bike.fromJson(bike_resp);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BikeViewScreen(bike: new_bike)),
          );
        },
      ),
    );
  }
}