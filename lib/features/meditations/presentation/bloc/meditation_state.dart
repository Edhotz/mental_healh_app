import 'package:mental_healh_app/features/meditations/domain/entities/daily_quotes.dart';
import 'package:mental_healh_app/features/meditations/domain/entities/mood_messages.dart';

abstract class MeditationState {}

class MeditationInitial extends MeditationState {}

class MeditationLoading extends MeditationState {}

class MeditationLoaded extends MeditationState {}

class MeditationError extends MeditationState {
  final String message;
  MeditationError({required this.message});
}

class DailyQuoteLoaded extends MeditationState {
  final DailyQuotes dailyQuotes;
  DailyQuoteLoaded({required this.dailyQuotes});
}

class MoodMessageLoaded extends MeditationState {
  final MoodMessages moodMessage;
  MoodMessageLoaded({required this.moodMessage});
}
