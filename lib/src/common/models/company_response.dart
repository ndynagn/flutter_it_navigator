import 'package:json_annotation/json_annotation.dart';

part 'company_response.g.dart';

@JsonSerializable()
class CompanyResponse {
  const CompanyResponse({
    required this.id,
    // required this.image,
    required this.name,
    required this.description,
  });

  factory CompanyResponse.fromJson(Map<String, dynamic> json) =>
      _$CompanyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyResponseToJson(this);

  final int id;
  // final String image;
  final String name;
  final String description;
}
