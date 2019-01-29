import 'package:exam/bike.dart';
import 'package:exam/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BikeViewScreen extends StatelessWidget {
  final Bike bike;

  BikeViewScreen({Key key, this.bike}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Return ${bike.name}"),
      ),

      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: <Widget>[
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
          Text("Owner: " +
              "${bike.owner}",
            style:  new TextStyle(
              fontSize: 18.0,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text("Status: " +
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
          Icons.assignment_return,
          color: Colors.white,
        ),
        backgroundColor: Colors.orange,
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
          final return_response = await http.post(globalURL()  + '/return', body: bikeJson);
          Navigator.pop(context, true);
        },
      ),
    );
  }
}