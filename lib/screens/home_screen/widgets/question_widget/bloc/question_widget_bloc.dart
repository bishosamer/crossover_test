import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crossover_test/models/question.dart';
part 'question_widget_event.dart';
part 'question_widget_state.dart';

class QuestionWidgetBloc
    extends Bloc<QuestionWidgetEvent, QuestionWidgetState> {
  QuestionWidgetBloc() : super(QuestionWidgetInitial()) {
    on<QuestionWidgetEvent>((event, emit) {
      if (event is QuestionWidgetRevealEvent) {
        if (event.question.type == 'mcq') {
          emit(QuestionWidgetRevealedMcq(event.question));
        } else if (event.question.type == 'flashcard') {
          emit(QuestionWidgetRevealedFlashCard(event.question));
        }
      }
      if (event is QuestionWidgetHideEvent) {
        emit(QuestionWidgetInitial());
      }
    });
  }
}
