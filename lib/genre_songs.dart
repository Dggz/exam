import 'package:exam/song.dart';
import 'package:exam/song_view.dart';
import 'package:flutter/material.dart';


class GenreScreen extends StatelessWidget {
  final List<Song> songs;

  GenreScreen({Key key, this.songs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Songs'),
      ),
      body: ListView.builder(
          itemCount: songs.length,
          padding: const EdgeInsets.all(15.0),
          itemBuilder: (context, position) {

            return Column(
              children: <Widget>[
                Divider(height: 5.0),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SongScreen(song: songs[position])),
                    );
                  },
                  title: Text(
                    '${songs[position].title}',
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  subtitle: Text(
                    '${songs[position].genre + ', ' + songs[position].album
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
