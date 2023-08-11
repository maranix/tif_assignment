import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tif_assignment/src/data/model/model.dart';
import 'package:tif_assignment/src/data/repository/repository.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends Bloc<Event, EventState> {
  EventBloc({
    required EventI repository,
  })  : _repository = repository,
        super(const EventInitial()) {
    on<EventFetched>(_onFetched);
  }

  Future<void> _onFetched(
    EventFetched event,
    Emitter<EventState> emit,
  ) async {
    emit(const EventLoading());

    try {
      final response = await _repository.getEventDetails(id: event.id);

      emit(EventLoaded(data: response));
    } on MalformedResponseException {
      emit(
        const EventFailed(
          message: 'Invalid response received from the server.',
        ),
      );
    } catch (_) {
      emit(
        const EventFailed(
          message:
              'A failure occurred while fetching events at this time\nPlease try again later.',
        ),
      );
    }
  }

  final EventI _repository;
}
