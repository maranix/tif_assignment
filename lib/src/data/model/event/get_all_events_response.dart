import 'package:equatable/equatable.dart';
import 'package:tif_assignment/src/data/model/model.dart';

final class GetAllEventsResponse extends Equatable {
  const GetAllEventsResponse({
    required this.content,
    required this.status,
  });

  final Content content;
  final bool status;

  factory GetAllEventsResponse.fromJson(Map<String, dynamic> json) {
    if (json
        case {
          'content': Map<String, dynamic> content,
          'status': bool status,
        }) {
      return GetAllEventsResponse(
        content: Content.fromJson(content),
        status: status,
      );
    } else {
      throw const FormatException(
        '''Failed to deserialize All Events response.

        Reason: Invalid JSON format''',
      );
    }
  }

  @override
  List<Object?> get props => [
        content,
        status,
      ];
}

final class Content extends Equatable {
  const Content({
    required this.data,
    required this.meta,
  });

  final List<Event> data;
  final Meta meta;

  factory Content.fromJson(Map<String, dynamic> json) {
    if (json
        case {
          'data': List<dynamic> data,
          'meta': Map<String, dynamic> meta,
        }) {
      final events = List<Event>.unmodifiable(
        data.map(
          (e) => Event.fromJson(e as Map<String, dynamic>),
        ),
      );

      return Content(
        data: events,
        meta: Meta.fromJson(meta),
      );
    } else {
      throw const FormatException(
        '''Failed to deserialize Content response.

        Reason: Invalid JSON format''',
      );
    }
  }

  @override
  List<Object?> get props => [
        data,
        meta,
      ];
}

final class Meta extends Equatable {
  const Meta({
    required this.total,
  });

  final int total;

  factory Meta.fromJson(Map<String, dynamic> json) {
    if (json
        case {
          'total': int total,
        }) {
      return Meta(total: total);
    } else {
      throw const FormatException(
        '''Failed to deserialize Meta response.

        Reason: Invalid JSON format''',
      );
    }
  }

  @override
  List<Object?> get props => [total];
}
