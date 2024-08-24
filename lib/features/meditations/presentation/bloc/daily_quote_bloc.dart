import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_healh_app/features/meditations/domain/usecases/daily_quotes.dart';
import 'package:mental_healh_app/features/meditations/presentation/bloc/daily_quote_event.dart';
import 'package:mental_healh_app/features/meditations/presentation/bloc/daily_quote_state.dart';

class DailyQuoteBloc extends Bloc<DailyQuoteEvent, DailyQuoteState> {
  final GetDailyQuotes getDailyQuotes;

  DailyQuoteBloc(this.getDailyQuotes) : super(DailyQuoteInitial()) {
    on<FetchDailyQuote>((event, emit) async {
      emit(DailyQuoteLoading());
      try {
        final dailyQuotes = await getDailyQuotes.call();
        emit(DailyQuoteLoaded(dailyQuotes: dailyQuotes));
      } catch (e) {
        emit(DailyQuoteError(message: e.toString()));
      }
    });
  }
}
