import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_it_navigator/src/common/models/course_education_response.dart';
import 'package:flutter_it_navigator/src/common/primary_card.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  late final Dio _dio;
  bool _isLoading = true;
  DioException? _error;
  late final List<CourseEducationResponse> _news;

  @override
  void initState() {
    _dio = GetIt.I.get<Dio>();
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    try {
      _isLoading = true;

      final response = await _dio.get<List<dynamic>>(
        '/courses-education/',
      );

      setState(() {
        _news = List.generate(
          response.data!.length,
          (index) => CourseEducationResponse.fromJson(
            response.data![0],
          ),
        );
      });
    } on DioException catch (e) {
      setState(() {
        _error = e;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            title: Text('Курсы'),
          ),
          if (_isLoading)
            const SliverFillRemaining(
              hasScrollBody: false,
              child: SafeArea(
                top: false,
                child: Center(
                  child: CupertinoActivityIndicator(),
                ),
              ),
            )
          else if (_error != null)
            SliverFillRemaining(
              hasScrollBody: false,
              child: SafeArea(
                top: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${_error!.response!.statusCode} '
                      '${_error!.response!.statusMessage!}',
                    ),
                  ],
                ),
              ),
            )
          else
            SliverList.separated(
              itemCount: _news.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: PrimaryCard(
                    title: _news[index].title,
                    subtitle: _news[index].experience,
                    image: _news[index].image,
                    onTap: () {},
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Gap(12);
              },
            ),
          const SliverGap(72),
        ],
      ),
    );
  }
}
