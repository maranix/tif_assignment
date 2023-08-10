import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tif_assignment/src/data/model/event/get_all_events_response.dart';
import 'package:tif_assignment/src/data/repository/repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required EventI repository,
  })  : _repository = repository,
        super(const HomeInitial()) {
    on<HomeFetched>(_onFetched);
  }

  Future<void> _onFetched(
    HomeFetched event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoading());

    try {
      final response = await _repository.getAllEvents();

      emit(HomeLoaded(data: response));
    } on MalformedResponseException {
      emit(
        const HomeFailed(
          message: 'Invalid response received from the server.',
        ),
      );
    } catch (_) {
      emit(
        const HomeFailed(
          message:
              'A failure occurred while fetching events at this time\nPlease try again later.',
        ),
      );
    }
  }

  final EventI _repository;
}
