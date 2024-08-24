import 'dart:convert';

import 'package:mental_healh_app/configs/constants/appUrls.dart';
import 'package:mental_healh_app/features/meditations/data/models/daily_quotes_model.dart';
import 'package:mental_healh_app/features/meditations/data/models/mood_message_model.dart';
import 'package:mental_healh_app/features/meditations/domain/entities/daily_quotes.dart';
import 'package:http/http.dart' as http;

abstract class MeditationRemoteDatasource {
  Future<DailyQuotes> getDailyQuote();
  Future<MoodMessageModel> GetMoodMessages(String mood);
}

class MeditationRemoteDatasourceImpl implements MeditationRemoteDatasource {
  final http.Client client;

  MeditationRemoteDatasourceImpl({required this.client});
  @override
  Future<DailyQuotes> getDailyQuote() async {
    final response =
        await client.get(Uri.parse("${Appurls.baseUrl}/meditation/dailyQuote"));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return DailyQuotesModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load daily quote');
    }
  }

  @override
  Future<MoodMessageModel> GetMoodMessages(String mood) async {
    final response = await client
        .get(Uri.parse("${Appurls.baseUrl}/meditation/myMood/$mood"));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return MoodMessageModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load mood message');
    }
  }
}
