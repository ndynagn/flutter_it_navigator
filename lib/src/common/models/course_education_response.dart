import 'package:json_annotation/json_annotation.dart';

part 'course_education_response.g.dart';

@JsonSerializable()
class CourseEducationResponse {
  const CourseEducationResponse({
    required this.id,
    required this.title,
    required this.experience,
    required this.image,
  });

  factory CourseEducationResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseEducationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseEducationResponseToJson(this);

  final int id;
  final String title;
  final String experience;
  final String image;
}
