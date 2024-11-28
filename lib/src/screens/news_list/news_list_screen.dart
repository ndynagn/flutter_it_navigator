import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_it_navigator/src/common/models/article_response.dart';
import 'package:flutter_it_navigator/src/common/primary_card.dart';
import 'package:flutter_it_navigator/src/common/primary_elevated_button.dart';
import 'package:flutter_it_navigator/src/screens/filters/filters_screen.dart';
import 'package:flutter_it_navigator/src/screens/news_list/details/article_details_screen.dart';
import 'package:flutter_it_navigator/src/screens/profile/profile_screen.dart';
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
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _authorController;

  @override
  void initState() {
    _dio = GetIt.I.get<Dio>();
    super.initState();
    _fetchNews();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _authorController = TextEditingController();
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

  Future<void> _createArticle() async {
    try {
      await _dio.post(
        '/news/',
        data: {
          'id': Random().nextInt(100000),
          'title': _titleController.text,
          'description': _descriptionController.text,
          'author': _authorController.text,
          'date_post': DateTime.now().toIso8601String(),
          'image':
              'https://airpods.kz/wp-content/uploads/2024/07/dyson-ontrack-1-1024x576.jpg'
        },
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Новость успешно создана'),
        ),
      );

      Navigator.pop(context);
    } on DioException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.response == null
                ? e.toString()
                : '${e.response!.statusCode} '
                    '${e.response!.statusMessage!}',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _fetchNews,
        child: CustomScrollView(
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
                IconButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                      fullscreenDialog: true,
                    ),
                  ),
                  icon: const Icon(
                    Icons.person_outlined,
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
                      image: _news[index].image,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ArticleDetailsScreen(
                              id: _news[index].id,
                            );
                          },
                        ),
                      ),
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
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: const ButtonStyle(
              minimumSize: WidgetStatePropertyAll(Size.zero),
            ),
            onPressed: () => showModalBottomSheet(
              context: context,
              useSafeArea: true,
              isScrollControlled: true,
              showDragHandle: true,
              backgroundColor: Colors.white,
              builder: (context) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('Добавление'),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(24),
                        const Text(
                          'Заголовок',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const Gap(12),
                        TextField(
                          controller: _titleController,
                          decoration: InputDecoration(
                            hintText: 'Британские ученые выяснили...',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.black.withOpacity(.4),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(.4),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(.4),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        const Gap(24),
                        const Text(
                          'Автор',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const Gap(12),
                        TextField(
                          controller: _authorController,
                          decoration: InputDecoration(
                            hintText: 'Автор',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.black.withOpacity(.4),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(.4),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(.4),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        const Gap(24),
                        const Text(
                          'Содержание',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const Gap(12),
                        TextField(
                          controller: _descriptionController,
                          minLines: 5,
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: 'Описание',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.black.withOpacity(.4),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(.4),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black.withOpacity(.4),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        const Gap(24),
                        ValueListenableBuilder(
                          valueListenable: _authorController,
                          builder: (context, authorValue, child) {
                            return ValueListenableBuilder(
                              valueListenable: _titleController,
                              builder: (context, titleValue, child) {
                                return ValueListenableBuilder(
                                  valueListenable: _descriptionController,
                                  builder: (context, descValue, child) {
                                    return PrimaryElevatedButton(
                                      onPressed: authorValue.text.isEmpty ||
                                              titleValue.text.isEmpty ||
                                              descValue.text.isEmpty
                                          ? null
                                          : _createArticle,
                                      child: const Text('Добавить новость'),
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: Row(
                children: [
                  Text(
                    'Добавить',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  Gap(4),
                  Icon(
                    Icons.add_rounded,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
