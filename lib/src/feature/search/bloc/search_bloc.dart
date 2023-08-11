import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tif_assignment/src/data/model/model.dart';
import 'package:tif_assignment/src/data/repository/repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({
    required EventI repository,
  })  : _repository = repository,
        super(const SearchInitial()) {
    on<SearchFetched>(_onFetched);
  }

  Future<void> _onFetched(
    SearchFetched event,
    Emitter<SearchState> emit,
  ) async {
    emit(const SearchLoading());

    try {
      final response = await _repository.searchAllEvents(query: event.query);

      emit(SearchLoaded(data: response));
    } on MalformedResponseException {
      emit(
        const SearchFailed(
          message: 'Invalid response received from the server.',
        ),
      );
    } catch (_) {
      emit(
        const SearchFailed(
          message:
              'A failure occurred while fetching events at this time\nPlease try again later.',
        ),
      );
    }
  }

  final EventI _repository;
}
