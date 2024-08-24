// ignore_for_file: non_constant_identifier_names

import 'package:mental_healh_app/features/music/domain/entities/song.dart';

class SongModel extends Song {
  SongModel(
      {required int id,
      required String title,
      required String author,
      required String song_link})
      : super(id: id, title: title, author: author, song_link: song_link);

  factory SongModel.fromJson(Map<String, dynamic> json) {
    return SongModel(
        id: json['id'],
        title: json['title'],
        author: json['author'],
        song_link: json['song_link']);
  }
}
