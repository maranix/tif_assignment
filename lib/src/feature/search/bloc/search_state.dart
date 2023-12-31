part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

final class SearchInitial extends SearchState {
  const SearchInitial();
}

final class SearchLoading extends SearchState {
  const SearchLoading();
}

final class SearchLoaded extends SearchState {
  const SearchLoaded({
    required this.data,
  });

  final SearchAllEventsResponse data;

  @override
  List<Object?> get props => [data];
}

final class SearchFailed extends SearchState {
  const SearchFailed({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => [message];
}
