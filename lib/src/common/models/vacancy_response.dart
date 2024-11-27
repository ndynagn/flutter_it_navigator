import 'package:json_annotation/json_annotation.dart';

part 'vacancy_response.g.dart';

@JsonSerializable()
class VacancyResponse {
  const VacancyResponse({
    required this.id,
    required this.name,
    required this.experience,
    required this.idCompany,
  });

  factory VacancyResponse.fromJson(Map<String, dynamic> json) =>
      _$VacancyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VacancyResponseToJson(this);

  final int id;
  final String name;
  final String experience;
  final int idCompany;
}
