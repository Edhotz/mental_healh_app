import 'package:mental_healh_app/features/meditations/domain/entities/mood_messages.dart';

class MoodMessageModel extends MoodMessages {
  MoodMessageModel({required String text}) : super(text: text);

  factory MoodMessageModel.fromJson(Map<String, dynamic> json) {
    return MoodMessageModel(text: json['text']);
  }
}
