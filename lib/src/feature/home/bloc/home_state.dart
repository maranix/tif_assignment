part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

final class HomeInitial extends HomeState {
  const HomeInitial();
}

final class HomeLoading extends HomeState {
  const HomeLoading();
}

final class HomeLoaded extends HomeState {
  const HomeLoaded({
    required this.data,
  });

  final GetAllEventsResponse data;

  @override
  List<Object?> get props => [data];
}

final class HomeFailed extends HomeState {
  const HomeFailed({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => [message];
}
