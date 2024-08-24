import 'dart:convert';
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
    try {
      final text = json['text'];
      if (text == null) throw FormatException('Missing "text" field');

      final candidates = text['candidates'] as List?;
      if (candidates == null || candidates.isEmpty)
        throw FormatException('Missing or empty "candidates"');

      final content = candidates[0]['content'] as Map<String, dynamic>?;
      if (content == null) throw FormatException('Missing "content"');

      final parts = content['parts'] as List?;
      if (parts == null || parts.isEmpty)
        throw FormatException('Missing or empty "parts"');

      final textContent = parts[0]['text'] as String?;
      if (textContent == null) throw FormatException('Missing "text" in parts');

      // Remove the ```json and ``` from the string
      final jsonString =
          textContent.replaceAll('```json', '').replaceAll('```', '').trim();

      final quotesMap = jsonDecode(jsonString) as Map<String, dynamic>;

      print(quotesMap);

      return DailyQuotesModel(
        morningQuote: quotesMap['morningQuote'] as String? ??
            'No morning quote available',
        noonQuote:
            quotesMap['noonQuote'] as String? ?? 'No noon quote available',
        eveningQuote: quotesMap['eveningQuote'] as String? ??
            'No evening quote available',
      );
    } catch (e) {
      print('Error parsing JSON: $e');
      return DailyQuotesModel(
          morningQuote: 'Error loading quote',
          noonQuote: 'Error loading quote',
          eveningQuote: 'Error loading quote');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'morningQuote': morningQuote,
      'noonQuote': noonQuote,
      'eveningQuote': eveningQuote
    };
  }
}
