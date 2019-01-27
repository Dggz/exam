import 'package:exam/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddSongScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    TextEditingController _titlecontroller = new TextEditingController();
    TextEditingController _txtcontroller = new TextEditingController();
    TextEditingController _albumcontroller = new TextEditingController();
    TextEditingController _yearcontroller = new TextEditingController();
    TextEditingController _genrecontroller = new TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Song"),
      ),

      body: ListView(
        children: <Widget>[
          TextFormField(
            controller: _titlecontroller,
            decoration: InputDecoration(
                labelText: 'Title'
            ),
          ),
          TextFormField(
            controller: _txtcontroller,
            decoration: InputDecoration(
                labelText: 'Description'
            ),
          ),
          TextFormField(
            controller: _albumcontroller,
            decoration: InputDecoration(
                labelText: 'Album'
            ),
          ),
          TextFormField(
            controller: _yearcontroller,
            decoration: InputDecoration(
                labelText: 'Year'
            ),
          ),
          TextFormField(
            controller: _genrecontroller,
            decoration: InputDecoration(
                labelText: 'Genre'
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
          print(_yearcontroller.text.toString());
          final songJson = {
            'title': _titlecontroller.text,
            'description': _txtcontroller.text,
            'album': _albumcontroller.text,
            'genre': _genrecontroller.text,
            'year': _yearcontroller.text
          };
          final post_response = await http.post(globalURL() + '/song/', body: songJson);
          Navigator.pop(context, true);
        },
      ),
    );
  }
}