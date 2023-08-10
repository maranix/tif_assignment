import 'package:equatable/equatable.dart';

final class Event extends Equatable {
  const Event({
    required this.id,
    required this.title,
    required this.description,
    required this.bannerImage,
    required this.dateTime,
    required this.organiserName,
    required this.organiserIcon,
    required this.venueName,
    required this.venueCity,
    required this.venueCountry,
  });

  final int id;
  final String title;
  final String description;
  final String bannerImage;
  final DateTime dateTime;
  final String organiserName;
  final String organiserIcon;
  final String venueName;
  final String venueCity;
  final String venueCountry;

  factory Event.fromJson(Map<String, dynamic> json) {
    if (json
        case {
          "id": int id,
          "title": String title,
          "description": String description,
          "banner_image": String bannerImage,
          "date_time": String dateTime,
          "organiser_name": String organiserName,
          "organiser_icon": String organiserIcon,
          "venue_name": String venueName,
          "venue_city": String venueCity,
          "venue_country": String venueCountry,
        }) {
      return Event(
        id: id,
        title: title,
        description: description,
        bannerImage: bannerImage,
        dateTime: DateTime.parse(dateTime),
        organiserName: organiserName,
        organiserIcon: organiserIcon,
        venueName: venueName,
        venueCity: venueCity,
        venueCountry: venueCountry,
      );
    } else {
      throw const FormatException(
        '''Failed to deserialize Event response.

        Reason: Invalid JSON format''',
      );
    }
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        bannerImage,
        dateTime,
        organiserName,
        organiserIcon,
        venueName,
        venueCity,
        venueCountry,
      ];
}
