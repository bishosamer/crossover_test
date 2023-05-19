import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crossover_test/models/question.dart';
import 'package:crossover_test/repository.dart';
import 'package:flutter/material.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(const HomeScreenInitial([])) {
    List<Question> followingQuestions = [];
    List<Question> forYouQuestions = [];
    on<HomeScreenForYouEvent>((event, emit) async {
      followingQuestions = event.questions;
      if (forYouQuestions.isEmpty) {
        emit(const HomeScreenLoading([]));
        forYouQuestions = await initializeFeed('for_you');

        emit(ForYouState(forYouQuestions));
      } else {
        emit(ForYouState(forYouQuestions));
      }
    });
    //-------------------
    on<HomeScreenFollowingEvent>((event, emit) async {
      forYouQuestions = event.questions;

      if (followingQuestions.isEmpty) {
        emit(const HomeScreenLoading([]));
        followingQuestions = await initializeFeed('following');

        emit(FollowingState(followingQuestions));
      } else {
        emit(FollowingState(followingQuestions));
      }
    });
//--------------------
    on<ScrollEvent>((event, emit) async {
      if (state is ForYouState) {
        Question question = await Repository.getQuestion('for_you');
        // remove a question from the list if it is already there

        if (checkPresence(event.questions, question)) {
          emit(ForYouState(event.questions));
        } else {
          event.questions.add(question);
          emit(ForYouState(event.questions));
        }
      } else if (state is FollowingState) {
        Question question = await Repository.getQuestion('following');
        if (checkPresence(event.questions, question)) {
          emit(FollowingState(event.questions));
        } else {
          event.questions.add(question);
          emit(FollowingState(event.questions));
        }
      }
    });
//--------------------
    on<HomeScreenInitialEvent>((event, emit) async {
      emit(const HomeScreenLoading([]));
      followingQuestions = await initializeFeed('following');

      emit(FollowingState(followingQuestions));
    });
  }
  bool checkPresence(List<Question> questions, Question question) {
    bool isPresent = false;
    for (var element in questions) {
      if (element.id == question.id) isPresent = true;
    }
    return isPresent;
  }

  Future<List<Question>> initializeFeed(String feedType) async {
    List<Question> questions = [];
    for (int i = 0; i < 3; i++) {
      Question question = await Repository.getQuestion(feedType);
      if (checkPresence(questions, question)) {
        i--;
      } else {
        questions.add(question);
      }
    }
    return questions;
  }
}
