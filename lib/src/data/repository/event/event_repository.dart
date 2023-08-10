part of 'event.dart';

final class EventRepository extends Repository implements EventI {
  EventRepository({
    required super.client,
  });

  @override
  Future<GetAllEventsResponse> getAllEvents() async {
    final uri = baseUri.copyWith(path: '/v1/event');

    final res = await client.get(uri);

    if (res.statusCode != HttpStatus.ok) {
      throw HttpException(
        'Request failed with status code : ${res.statusCode}',
        uri: uri,
      );
    }

    return GetAllEventsResponse.fromJson(res.toJson());
  }

  @override
  Future<GetEventDetailsResponse> getEventDetails({
    required String id,
  }) async {
    final uri = baseUri.copyWith(
      path: '/v1/event/$id',
    );

    final res = await client.get(uri);

    if (res.statusCode != HttpStatus.ok) {
      throw HttpException(
        'Request failed with status code : ${res.statusCode}',
        uri: uri,
      );
    }

    return GetEventDetailsResponse.fromJson(res.toJson());
  }

  @override
  Future<SearchAllEventsResponse> searchAllEvents({
    required String query,
  }) async {
    final uri = baseUri.copyWith(
      path: '/v1/event',
      queryParameters: {
        'search': query,
      },
    );

    final res = await client.get(uri);

    if (res.statusCode != HttpStatus.ok) {
      throw HttpException(
        'Request failed with status code : ${res.statusCode}',
        uri: uri,
      );
    }

    return SearchAllEventsResponse.fromJson(res.toJson());
  }
}
