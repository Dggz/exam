//import 'dart:convert';
//
//import 'package:exam/genre_songs.dart';
//import 'package:exam/home.dart';
//import 'package:exam/song.dart';
//import 'package:flutter/material.dart';
//import 'package:exam/editreminder.dart';
//import 'package:http/http.dart' as http;
//
//import 'reminder.dart';
//
//
//
//class ListViewGenres extends StatelessWidget {
//  final List<String> genres;
//
//  ListViewGenres({Key key, this.genres}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Genres'),
//      ),
//      body: ListView.builder(
//          itemCount: genres.length,
//          padding: const EdgeInsets.all(15.0),
//          itemBuilder: (context, position) {
//
//            return Column(
//              children: <Widget>[
//                Divider(height: 5.0),
//                ListTile(
//                  onTap: () async {
//                    final response = await http.get(globalURL() + "/songs/" + genres[position]);
//                    final parsed = json.decode(response.body);
//                    List<Song> songs = parsed.map<Song>((json) => Song.fromJson(json)).toList();
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (context) => GenreScreen(songs: songs)),
//                    );
//                  },
//                  title: Text(
//                    '${genres[position]}',
//                    style: TextStyle(
//                      fontSize: 22.0,
//                      color: Colors.deepOrangeAccent,
//                    ),
//                  ),
//                ),
//              ],
//            );
//          }),
//    );
//  }
//}
