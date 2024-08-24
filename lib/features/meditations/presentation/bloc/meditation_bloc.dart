import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_healh_app/features/meditations/domain/usecases/daily_quotes.dart';
import 'package:mental_healh_app/features/meditations/domain/usecases/get_mood_messages.dart';
import 'package:mental_healh_app/features/meditations/presentation/bloc/meditation_event.dart';
import 'package:mental_healh_app/features/meditations/presentation/bloc/meditation_state.dart';

class MeditationBloc extends Bloc<MeditationEvent, MeditationState> {
  final GetDailyQuotes getDailyQuotes;
  final GetMoodMessages getMoodMessages;

  MeditationBloc({required this.getDailyQuotes, required this.getMoodMessages})
      : super(MeditationInitial()) {
    on<FetchDailyQuotes>((event, emit) async {
      emit(MeditationLoading());
      try {
        final dailyQuotes = await getDailyQuotes.call();
        emit(DailyQuoteLoaded(dailyQuotes: dailyQuotes));
      } catch (e) {
        emit(MeditationError(message: e.toString()));
      }
    });

    on<FetchMoodMessages>((event, emit) async {
      try {
        final moodMessages = await getMoodMessages.call(event.mood);
        emit(MoodMessageLoaded(moodMessage: moodMessages));
      } catch (e) {
        emit(MeditationError(message: e.toString()));
      }
    });
  }
}
