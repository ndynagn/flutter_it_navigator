import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_it_navigator/src/common/models/article_response.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class ArticleDetailsScreen extends StatefulWidget {
  const ArticleDetailsScreen({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<ArticleDetailsScreen> createState() => _ArticleDetailsScreenState();
}

class _ArticleDetailsScreenState extends State<ArticleDetailsScreen> {
  late final Dio _dio;
  bool _isLoading = true;
  DioException? _error;
  late final ArticleResponse _news;

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
        '/news/',
        queryParameters: {
          'news_id': widget.id,
        },
      );

      setState(() {
        _news = ArticleResponse.fromJson(
          response.data![0],
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
      appBar: AppBar(
        title: const Text('Новости'),
      ),
      body: CustomScrollView(
        slivers: [
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
          else ...[
            const SliverToBoxAdapter(
              child: SizedBox(height: 12),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
              ),
              sliver: SliverToBoxAdapter(
                child: Container(
                  height: 330,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(_news.image),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 12),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
              ),
              sliver: SliverToBoxAdapter(
                child: Text(
                  _news.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 12),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
              ),
              sliver: SliverToBoxAdapter(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _news.description,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black.withOpacity(.4),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 24),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
              ),
              sliver: SliverToBoxAdapter(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Автор: ${_news.author}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 12),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
              ),
              sliver: SliverToBoxAdapter(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Дата публикации: ${DateFormat.yMMMd().format(
                          _news.datePost,
                        )}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
