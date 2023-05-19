import 'dart:convert';

import 'package:crossover_test/models/question.dart';

import 'package:http/http.dart' as http;

class Repository {
  static const String baseUrl = 'https://cross-platform.rp.devfactory.com';
  static Future<Question> getQuestion(String source) async {
    try {
      var res = await http.get(Uri.parse('$baseUrl/$source'));
      if (res.statusCode != 200) {
        throw Exception('Error getting question');
      }
      Question question = Question.fromJson(jsonDecode(res.body));
      if (question.type == 'mcq') {
        String correctOption = await Repository.getCorrectOption(question.id);
        question.answer = correctOption;
      }
      return question;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<String> getCorrectOption(int questionId) async {
    try {
      var res = await http.get(Uri.parse('$baseUrl/reveal?id=$questionId'));
      if (res.statusCode != 200) {
        throw Exception('Error getting correct option');
      }
      return jsonDecode(res.body)['correct_options'][0]['answer'];
    } catch (e) {
      throw Exception(e);
    }
  }
}
