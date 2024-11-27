import 'package:json_annotation/json_annotation.dart';

part 'education_company_response.g.dart';

@JsonSerializable()
class EducationCompanyResponse {
  const EducationCompanyResponse({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
  });

  factory EducationCompanyResponse.fromJson(Map<String, dynamic> json) =>
      _$EducationCompanyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EducationCompanyResponseToJson(this);

  final int id;
  final String image;
  final String name;
  final String description;
}