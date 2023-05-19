part of 'home_screen_bloc.dart';

@immutable
abstract class HomeScreenState {
  final List<Question> questions;

  const HomeScreenState(this.questions);
}

class HomeScreenInitial extends HomeScreenState {
  const HomeScreenInitial(super.questions);
}

class HomeScreenLoading extends HomeScreenState {
  const HomeScreenLoading(super.questions);
}

class ForYouState extends HomeScreenState {
  const ForYouState(super.questions);
}

class FollowingState extends HomeScreenState {
  const FollowingState(super.questions);
}
