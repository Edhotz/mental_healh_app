import 'package:mental_healh_app/features/meditations/domain/entities/daily_quotes.dart';

class DailyQuotesModel extends DailyQuotes {
  DailyQuotesModel(
      {required String morningQuote,
      required String noonQuote,
      required String eveningQuote})
      : super(
            morningQuote: morningQuote,
            noonQuote: noonQuote,
            eveningQuote: eveningQuote);

  factory DailyQuotesModel.fromJson(Map<String, dynamic> json) {
    final quotes = json['text'];

    return DailyQuotesModel(
        morningQuote: quotes['morningQuote'],
        noonQuote: quotes['noonQuote'],
        eveningQuote: quotes['eveningQuote']);
  }
}
