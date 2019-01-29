import 'package:exam/bike.dart';
import 'package:exam/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BikeEditScreen extends StatelessWidget {
  final Bike bike;

  BikeEditScreen({Key key, this.bike}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("${bike.name}"),
      ),

      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: <Widget>[
          Text("Description: " +
              "${bike.type}",
            style:  new TextStyle(
              fontSize: 18.0,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text("Album: " +
              "${bike.size}",
            style:  new TextStyle(
              fontSize: 18.0,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text("Year: " +
              "${bike.owner}",
            style:  new TextStyle(
              fontSize: 18.0,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text("Genre: " +
              "${bike.status}",
            style:  new TextStyle(
              fontSize: 18.0,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
        onPressed: () async {
          final String id = bike.id.toString();
          final delete_response = await http.delete(globalURL()  + '/bike/' + id);
          Navigator.pop(context, true);
        },
      ),
    );
  }
}