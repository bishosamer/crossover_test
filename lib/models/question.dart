import 'package:crossover_test/models/user.dart';
import 'package:crossover_test/models/option.dart';

class Question {
  final String type;
  final String question;
  final List<Option> options;
  final String description;
  final int id;
  final String playlist;
  late String? answer;
  final User user;

  Question(
      {required this.type,
      required this.question,
      required this.options,
      required this.description,
      required this.id,
      required this.playlist,
      required this.user,
      this.answer});

  factory Question.fromJson(Map<String, dynamic> json) {
    if (json['type'] == 'flashcard') {
      return Question(
        type: json['type'],
        question: json['flashcard_front'],
        options: [],
        description: json['description'],
        id: json['id'],
        playlist: json['playlist'],
        answer: json['flashcard_back'],
        user: User.fromJson(json['user']),
      );
    } else {
      return Question(
        type: json['type'],
        question: json['question'],
        options: json['options']
            .map<Option>((option) => Option.fromJson(option))
            .toList(),
        description: json['description'],
        id: json['id'],
        playlist: json['playlist'],
        user: User.fromJson(json['user']),
      );
    }
  }
}
