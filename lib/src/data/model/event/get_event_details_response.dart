import 'package:equatable/equatable.dart';
import 'package:tif_assignment/src/data/model/model.dart';

final class GetEventDetailsResponse extends Equatable {
  const GetEventDetailsResponse({
    required this.content,
    required this.status,
  });

  final Content content;
  final bool status;

  factory GetEventDetailsResponse.fromJson(Map<String, dynamic> json) {
    if (json
        case {
          'content': Map<String, dynamic> content,
          'status': bool status,
        }) {
      return GetEventDetailsResponse(
        content: Content.fromJson(content),
        status: status,
      );
    } else {
      throw const FormatException(
        '''Failed to deserialize Event Details response.

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
  });

  final Event data;

  factory Content.fromJson(Map<String, dynamic> json) {
    if (json
        case {
          'data': Map<String, dynamic> data,
        }) {
      return Content(
        data: Event.fromJson(data),
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
      ];
}
