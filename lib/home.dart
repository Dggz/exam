import 'dart:convert';

import 'package:exam/bike.dart';
import 'package:exam/bike_rent.dart';
import 'package:exam/clerk_side.dart';
import 'package:exam/client_side.dart';
import 'package:exam/owner_screen.dart';
import 'package:exam/song.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String globalURL() {
  return 'http://192.168.42.231:2028';
//  return 'http://192.168.0.102:8000/reminders/';
//  return 'http://10.182.5.51:8000/reminders/';
//  return 'http://10.182.5.51:8000/reminders/';
}


//Future<List<Reminder>> fetchPosts(http.Client client) async {
//  final response = await http.get(globalURL() + "/genres");
//  if (response.statusCode == 200) {
//    // If the call to the server was successful, parse the JSON
//    final parsed = json.decode(response.body);
//
//    return parsed.map<Reminder>((json) => Reminder.fromJson(json)).toList();
//  }
//  else {
//    // If that call was not successful, throw an error.
//    throw Exception('Failed to load post');
//  }
//}


class HomePage extends StatelessWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            onPressed: () async {
              final response = await http.get(globalURL() + "/bikes");
              final parsed = json.decode(response.body);
              List<Bike> bikes = parsed.map<Bike>((json) => Bike.fromJson(json)).toList();
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RentScreen(bikes: bikes)),
              );
            },
            child: new Text('Client')
          ),
          RaisedButton(
            onPressed: () async {
              final response = await http.get(globalURL() + "/all");
              final parsed = json.decode(response.body);
              List<Bike> bikes = parsed.map<Bike>((json) => Bike.fromJson(json)).toList();
              bikes.sort((a, b) => -a.type.compareTo(b.type));
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OwnerScreen(bikes: bikes)),
              );
            },
            child: new Text('Owner')
          ),
        ],
      ),
    );
  }
}