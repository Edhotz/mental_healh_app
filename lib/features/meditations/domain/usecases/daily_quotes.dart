import 'package:mental_healh_app/features/meditations/domain/entities/daily_quotes.dart';
import 'package:mental_healh_app/features/meditations/domain/repository/meditation_repository.dart';

class GetDailyQuotes {
  final MeditationRepository repository;

  GetDailyQuotes({required this.repository});

  Future<DailyQuotes> call() async {
    return await repository.getdailyQuote();
  }
}
