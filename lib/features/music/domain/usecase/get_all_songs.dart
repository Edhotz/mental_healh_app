import 'package:mental_healh_app/features/music/domain/entities/song.dart';
import 'package:mental_healh_app/features/music/domain/repository/song_repository.dart';

class GetAllSongs {
  final SongRepository repository;

  GetAllSongs({required this.repository});

  Future<List<Song>> call() async {
    return await repository.getAllSongs();
  }
}
