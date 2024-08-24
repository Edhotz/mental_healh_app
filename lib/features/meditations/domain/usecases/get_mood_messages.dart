import 'package:mental_healh_app/features/meditations/domain/entities/mood_messages.dart';
import 'package:mental_healh_app/features/meditations/domain/repository/meditation_repository.dart';

class GetMoodMessages {
  final MeditationRepository repository;

  GetMoodMessages({required this.repository});

  Future<MoodMessages> call(String mood) async {
    return await repository.getMoodMessage(mood);
  }
}
