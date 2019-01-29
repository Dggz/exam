import 'package:exam/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddBikeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    TextEditingController _namecontroller = new TextEditingController();
    TextEditingController _typecontroller = new TextEditingController();
    TextEditingController _sizecontroller = new TextEditingController();
    TextEditingController _ownercontroller = new TextEditingController();
    TextEditingController _statuscontroller = new TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Bike"),
      ),

      body: ListView(
        children: <Widget>[
          TextFormField(
            controller: _namecontroller,
            decoration: InputDecoration(
                labelText: 'Name'
            ),
          ),
          TextFormField(
            controller: _typecontroller,
            decoration: InputDecoration(
                labelText: 'Type'
            ),
          ),
          TextFormField(
            controller: _sizecontroller,
            decoration: InputDecoration(
                labelText: 'Size'
            ),
          ),
          TextFormField(
            controller: _ownercontroller,
            decoration: InputDecoration(
                labelText: 'Owner'
            ),
          ),
          TextFormField(
            controller: _statuscontroller,
            decoration: InputDecoration(
                labelText: 'Status'
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.send,
          color: Colors.white,
        ),
        backgroundColor: Colors.orange,
        onPressed: () async {
          print(_ownercontroller.text.toString());
          final bikeJson = {
            'name': _namecontroller.text,
            'type': _typecontroller.text,
            'size': _sizecontroller.text,
            'owner': _statuscontroller.text,
            'status': _ownercontroller.text
          };
          final post_response = await http.post(globalURL() + '/bike/', body: bikeJson);
          Navigator.pop(context, true);
        },
      ),
    );
  }
}