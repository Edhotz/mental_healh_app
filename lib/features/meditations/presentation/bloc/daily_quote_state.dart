import 'package:mental_healh_app/features/meditations/domain/entities/daily_quotes.dart';

abstract class DailyQuoteState {}

class DailyQuoteInitial extends DailyQuoteState {}

class DailyQuoteLoading extends DailyQuoteState {}

class DailyQuoteLoaded extends DailyQuoteState {
  final DailyQuotes dailyQuotes;
  DailyQuoteLoaded({required this.dailyQuotes});
}

class DailyQuoteError extends DailyQuoteState {
  final String message;
  DailyQuoteError({required this.message});
}
