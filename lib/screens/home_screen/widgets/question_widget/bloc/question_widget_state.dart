part of 'question_widget_bloc.dart';

@immutable
abstract class QuestionWidgetState {}

class QuestionWidgetInitial extends QuestionWidgetState {}

class QuestionWidgetRevealedMcq extends QuestionWidgetState {
  final Question question;

  QuestionWidgetRevealedMcq(this.question);
}

class QuestionWidgetRevealedFlashCard extends QuestionWidgetState {
  final Question question;

  QuestionWidgetRevealedFlashCard(this.question);
}
