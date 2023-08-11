part of 'event_bloc.dart';

sealed class EventState extends Equatable {
  const EventState();

  @override
  List<Object?> get props => [];
}

final class EventInitial extends EventState {
  const EventInitial();
}

final class EventLoading extends EventState {
  const EventLoading();
}

final class EventLoaded extends EventState {
  const EventLoaded({
    required this.data,
  });

  final GetEventDetailsResponse data;

  @override
  List<Object?> get props => [data];
}

final class EventFailed extends EventState {
  const EventFailed({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => [message];
}
