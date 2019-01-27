import 'package:exam/add_song.dart';
import 'package:exam/song.dart';
import 'package:exam/song_edit.dart';
import 'package:flutter/material.dart';


class ClerkScreen extends StatelessWidget {
  final List<Song> songs;

  ClerkScreen({Key key, this.songs}) : super(key: key);

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
                      MaterialPageRoute(builder: (context) => SongEditScreen(song: songs[position])),
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
                  '${songs[position].album + ', '
                     + songs[position].genre + ', '
                     + songs[position].year.toString()
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
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.orange,
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddSongScreen()),
          );

        },
      ),
    );
  }
}
