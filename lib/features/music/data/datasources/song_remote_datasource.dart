import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mental_healh_app/configs/constants/appUrls.dart';
import 'package:mental_healh_app/features/music/data/models/song_model.dart';
import 'package:mental_healh_app/features/music/domain/entities/song.dart';

abstract class SongRemoteDatasource {
  Future<List<Song>> getAllSongs();
}

class SongRemoteDatasourceImpl implements SongRemoteDatasource {
  final http.Client client;

  SongRemoteDatasourceImpl({required this.client});
  @override
  Future<List<Song>> getAllSongs() async {
    final response =
        await client.get(Uri.parse("${Appurls.baseUrl}/songs/all"));

    print('Response status: ${response.statusCode}');
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      print(jsonResponse);
      return jsonResponse.map((song) => SongModel.fromJson(song)).toList();
    } else {
      throw Exception('Failed to load songs');
    }
  }
}
