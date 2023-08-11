part of 'event_bloc.dart';

sealed class Event extends Equatable {
  const Event();

  @override
  List<Object?> get props => [];
}

final class EventFetched extends Event {
  const EventFetched({
    required this.id,
  });

  final int id;

  @override
  List<Object?> get props => [id];
}
