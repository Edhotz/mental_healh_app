import 'package:mental_healh_app/features/meditations/domain/entities/daily_quotes.dart';
import 'package:mental_healh_app/features/meditations/domain/entities/mood_messages.dart';

abstract class MeditationRepository {
  Future<DailyQuotes> getdailyQuote();
  Future<MoodMessages> getMoodMessage(String mood);
}
