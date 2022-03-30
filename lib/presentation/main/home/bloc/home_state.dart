part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [Random().nextDouble()];
}

class HomeInit extends HomeState {
  const HomeInit();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeResults extends HomeState {
  const HomeResults();
}

class HomeError extends HomeState {
  const HomeError();
}
