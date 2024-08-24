import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_healh_app/features/music/domain/usecase/get_all_songs.dart';
import 'package:mental_healh_app/features/music/presentation/bloc/song_event.dart';
import 'package:mental_healh_app/features/music/presentation/bloc/song_state.dart';

class SongBloc extends Bloc<SongEvent, SongState> {
  final GetAllSongs getAllSongs;
  SongBloc({required this.getAllSongs}) : super(SongInitial()) {
    on<FetchSongs>((event, emit) async {
      emit(SongLoading());

      try {
        final songs = await getAllSongs.call();
        emit(SongLoaded(songs: songs));
      } catch (e) {
        emit(SongError(message: e.toString()));
      }
    });
  }
}
