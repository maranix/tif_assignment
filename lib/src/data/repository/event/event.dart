import 'dart:io';

import 'package:tif_assignment/src/data/model/model.dart';
import 'package:tif_assignment/src/data/repository/repository.dart';
import 'package:tif_assignment/src/utils/utils.dart';

part 'event_repository.dart';

interface class EventI {
  Future<GetAllEventsResponse> getAllEvents() {
    throw UnimplementedError('getAllEvents() is not yet implemented');
  }

  Future<GetEventDetailsResponse> getEventDetails({
    required String id,
  }) {
    throw UnimplementedError('getEventDetails() is not yet implemented');
  }

  Future<SearchAllEventsResponse> searchAllEvents({
    required String query,
  }) {
    throw UnimplementedError('searchAllEvents() is not yet implemented');
  }
}
