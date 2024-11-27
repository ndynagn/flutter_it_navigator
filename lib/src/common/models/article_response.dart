import 'package:json_annotation/json_annotation.dart';

part 'article_response.g.dart';

@JsonSerializable()
class ArticleResponse {
  const ArticleResponse({
    required this.id,
    // required this.image,
    required this.title,
    required this.description,
    required this.datePost,
    required this.author,
  });

  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleResponseToJson(this);

  @JsonKey(name: 'id')
  final int id;
  // final String image;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'date_post')
  final DateTime datePost;

  @JsonKey(name: 'author')
  final String author;
}
