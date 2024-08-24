abstract class MeditationEvent {}

class FetchDailyQuotes extends MeditationEvent {}

class FetchMoodMessages extends MeditationEvent {
  final String mood;
  FetchMoodMessages({required this.mood});
}
