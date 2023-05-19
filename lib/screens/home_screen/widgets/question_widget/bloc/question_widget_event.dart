part of 'question_widget_bloc.dart';

@immutable
abstract class QuestionWidgetEvent {}

class QuestionWidgetRevealEvent extends QuestionWidgetEvent {
  final Question question;

  QuestionWidgetRevealEvent(this.question);
}

class QuestionWidgetHideEvent extends QuestionWidgetEvent {
  QuestionWidgetHideEvent();
}
