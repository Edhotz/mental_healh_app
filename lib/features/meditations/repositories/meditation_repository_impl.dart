import 'package:mental_healh_app/features/meditations/data/datasources/meditation_remote_datasource.dart';
import 'package:mental_healh_app/features/meditations/domain/entities/daily_quotes.dart';
import 'package:mental_healh_app/features/meditations/domain/entities/mood_messages.dart';
import 'package:mental_healh_app/features/meditations/domain/repository/meditation_repository.dart';

class MeditationRepositoryImpl implements MeditationRepository {
  final MeditationRemoteDatasource remotedatasource;

  MeditationRepositoryImpl({required this.remotedatasource});
  @override
  Future<DailyQuotes> getdailyQuote() async {
    return await remotedatasource.getDailyQuote();
  }

  @override
  Future<MoodMessages> getMoodMessage(String mood) async {
    return await remotedatasource.getMoodMessages(mood);
  }
}
