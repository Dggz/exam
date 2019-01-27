import 'package:exam/song.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SongScreen extends StatelessWidget {
  final Song song;

  SongScreen({Key key, this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("${song.title}"),
      ),

      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: <Widget>[
          Text("Description: " +
              "${song.description}",
            style:  new TextStyle(
              fontSize: 18.0,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text("Album: " +
              "${song.album}",
            style:  new TextStyle(
              fontSize: 18.0,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text("Year: " +
              "${song.year}",
            style:  new TextStyle(
              fontSize: 18.0,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text("Genre: " +
              "${song.genre}",
            style:  new TextStyle(
              fontSize: 18.0,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}