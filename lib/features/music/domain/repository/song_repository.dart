import 'package:mental_healh_app/features/music/domain/entities/song.dart';

abstract class SongRepository {
  Future<List<Song>> getAllSongs();
}
