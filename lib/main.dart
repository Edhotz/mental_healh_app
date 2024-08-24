import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_healh_app/core/theme.dart';
import 'package:mental_healh_app/features/meditations/data/datasources/meditation_remote_datasource.dart';
import 'package:mental_healh_app/features/meditations/domain/usecases/daily_quotes.dart';
import 'package:mental_healh_app/features/meditations/domain/usecases/get_mood_messages.dart';
import 'package:mental_healh_app/features/meditations/presentation/bloc/meditation_bloc.dart';
import 'package:mental_healh_app/features/meditations/repositories/meditation_repository_impl.dart';
import 'package:mental_healh_app/features/music/data/datasources/song_remote_datasource.dart';
import 'package:mental_healh_app/features/music/data/repository/song_repository_impl.dart';
import 'package:mental_healh_app/features/music/domain/usecase/get_all_songs.dart';
import 'package:mental_healh_app/features/music/presentation/bloc/song_bloc.dart';
import 'package:mental_healh_app/features/music/presentation/bloc/song_event.dart';
import 'package:mental_healh_app/presentation/bottomNavBar/bloc/navigation_bloc.dart';
import 'package:mental_healh_app/presentation/homePage/home_page.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NavigationBloc()),
          BlocProvider(
              create: (context) => SongBloc(
                    getAllSongs: GetAllSongs(
                      repository: SongRepositoryImpl(
                        remoteDatasource: SongRemoteDatasourceImpl(
                          client: http.Client(),
                        ),
                      ),
                    ),
                  )..add(FetchSongs())),
          BlocProvider(
              create: (context) => MeditationBloc(
                  getDailyQuotes: GetDailyQuotes(
                      repository: MeditationRepositoryImpl(
                    remotedatasource:
                        MeditationRemoteDatasourceImpl(client: http.Client()),
                  )),
                  getMoodMessages: GetMoodMessages(
                      repository: MeditationRepositoryImpl(
                    remotedatasource:
                        MeditationRemoteDatasourceImpl(client: http.Client()),
                  )))),
        ],
        child: MaterialApp(
          title: "Meditation App",
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          home: HomeScreen(),
        ));
  }
}
