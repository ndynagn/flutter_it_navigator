import 'package:json_annotation/json_annotation.dart';

part 'vacancy_response.g.dart';

@JsonSerializable()
class VacancyResponse {
  const VacancyResponse({
    required this.id,
    required this.name,
    required this.experience,
    required this.idCompany,
    required this.image,
  });

  factory VacancyResponse.fromJson(Map<String, dynamic> json) =>
      _$VacancyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VacancyResponseToJson(this);

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'experience')
  final String experience;

  @JsonKey(name: 'id_company')
  final int idCompany;

  @JsonKey(name: 'image')
  final String image;
}
