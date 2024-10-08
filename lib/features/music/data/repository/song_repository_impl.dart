import 'package:mental_healh_app/features/music/data/datasources/song_remote_datasource.dart';
import 'package:mental_healh_app/features/music/domain/entities/song.dart';
import 'package:mental_healh_app/features/music/domain/repository/song_repository.dart';

class SongRepositoryImpl implements SongRepository {
  final SongRemoteDatasource remoteDatasource;
  SongRepositoryImpl({required this.remoteDatasource});

  @override
  Future<List<Song>> getAllSongs() async {
    final songModels = await remoteDatasource.getAllSongs();
    return songModels;
  }
}
