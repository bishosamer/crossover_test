part of 'home_screen_bloc.dart';

@immutable
abstract class HomeScreenEvent {}

class HomeScreenInitialEvent extends HomeScreenEvent {}

class HomeScreenForYouEvent extends HomeScreenEvent {
  final List<Question> questions;

  HomeScreenForYouEvent(
    this.questions,
  );
}

class HomeScreenFollowingEvent extends HomeScreenEvent {
  final List<Question> questions;

  HomeScreenFollowingEvent(this.questions);
}

class ScrollEvent extends HomeScreenEvent {
  final List<Question> questions;

  ScrollEvent(
    this.questions,
  );
}
