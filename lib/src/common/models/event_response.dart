import 'package:json_annotation/json_annotation.dart';

part 'event_response.g.dart';

@JsonSerializable()
class EventResponse {
  const EventResponse({
    // required this.image,
    required this.title,
    required this.status,
    required this.date,
    required this.countPeople,
    required this.city,
    required this.countDayToStart,
  });

  factory EventResponse.fromJson(Map<String, dynamic> json) =>
      _$EventResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EventResponseToJson(this);

  // final String image;
  final String title;
  final String status;
  final DateTime date;
  final int countPeople;
  final String city;
  final int countDayToStart;
}
