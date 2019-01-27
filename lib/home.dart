import 'dart:convert';

import 'package:exam/clerk_side.dart';
import 'package:exam/client_side.dart';
import 'package:exam/song.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String globalURL() {
  return 'http://192.168.0.102:2224';
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
              final response = await http.get(globalURL() + "/genres");
              final List<String> genres = new List<String>.from(json.decode(response.body));
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ListViewGenres(genres: genres)),
              );
            },
            child: new Text('Client')
          ),
          RaisedButton(
            onPressed: () async {
              final response = await http.get(globalURL() + "/all");
              final parsed = json.decode(response.body);
              List<Song> songs = parsed.map<Song>((json) => Song.fromJson(json)).toList();
//              print(songs[1].title.compareTo(songs[0].title));
//              print(songs[0].album);
//              songs.sort((a, b) => a.album.compareTo(b.album));
              songs.sort((a, b) => a.title.compareTo(b.title));
//              songs.sort((a, b) => a.album.compareTo(b.album) + a.title.compareTo(b.title));
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ClerkScreen(songs: songs)),
              );
            },
            child: new Text('Clerk')
          ),
        ],
      ),
    );
  }
}