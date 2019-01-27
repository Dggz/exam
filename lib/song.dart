class Song {
  final int id;
  String title;
  String description;
  String album;
  String genre;
  int year;

  Song({
    this.id,
    this.title,
    this.description,
    this.album,
    this.genre,
    this.year
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    if (json['year'].runtimeType == String){
      json['year'] = int.parse(json['year']);
    }
    return Song(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      album: json['album'],
      genre: json['genre'],
      year: json['year']
    );
  }
}

