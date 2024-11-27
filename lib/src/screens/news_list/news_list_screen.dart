import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_it_navigator/src/common/models/article_response.dart';
import 'package:flutter_it_navigator/src/common/primary_card.dart';
import 'package:flutter_it_navigator/src/screens/filters/filters_screen.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  late final Dio _dio;
  bool _isLoading = true;
  DioException? _error;
  List<ArticleResponse> _news = [];

  @override
  void initState() {
    _dio = GetIt.I.get<Dio>();
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    try {
      _isLoading = true;

      final response = await _dio.get<List<dynamic>>('/news/');

      setState(() {
        _news = List.generate(
          response.data!.length,
          (index) => ArticleResponse.fromJson(
            response.data![index],
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
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          title: const Text('Новости'),
          actions: [
            IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FiltersScreen(),
                  fullscreenDialog: true,
                ),
              ),
              icon: const Icon(
                Icons.sort_outlined,
              ),
            ),
            const SizedBox(width: 16),
          ],
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
                  subtitle: _news[index].description,
                  image:
                      'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.tiktok.com%2Fdiscover%2F%25D1%2582%25D0%25BE%25D0%25BC%25D0%25B0%25D1%2581-%25D1%2588%25D0%25B5%25D0%25BB%25D0%25B1%25D0%25B8-%25D0%25BC%25D0%25B5%25D0%25BC&psig=AOvVaw0OshgM3v5yfqOhUtMggVL2&ust=1732694438376000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCICqtvbD-YkDFQAAAAAdAAAAABAJ',
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Gap(12);
            },
          )
      ],
    );
  }
}
