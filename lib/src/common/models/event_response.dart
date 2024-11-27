import 'package:json_annotation/json_annotation.dart';

part 'event_response.g.dart';

@JsonSerializable()
class EventResponse {
  const EventResponse({
    required this.id,
    required this.image,
    required this.title,
    required this.status,
    required this.date,
    required this.countPeople,
    required this.city,
    required this.countDayToStart,
  });

  // "id": 3,
  // "title": "Конференция по Cloud Computing",
  // "status": "Активно",
  // "date": "2023-11-03T12:00:00",
  // "count_people": 300,
  // "city": "Новосибирск",
  // "count_day_to_start": 32,
  // "image": "https://cdn.iz.ru/sites/default/files/inline/5249282375060415461.jpg"

  factory EventResponse.fromJson(Map<String, dynamic> json) =>
      _$EventResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EventResponseToJson(this);

  final int id;
  final String image;
  final String title;
  final String status;
  final DateTime date;

  @JsonKey(name: 'count_people')
  final int countPeople;
  final String city;

  @JsonKey(name: 'count_day_to_start')
  final int countDayToStart;
}
