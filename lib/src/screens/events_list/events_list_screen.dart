import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_it_navigator/src/common/models/event_response.dart';
import 'package:flutter_it_navigator/src/screens/filters/filters_screen.dart';
import 'package:flutter_it_navigator/src/screens/profile/profile_screen.dart';
import 'package:flutter_it_navigator/src/screens/events_list/widgets/event_widget.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

class EventsListScreen extends StatefulWidget {
  const EventsListScreen({super.key});

  @override
  State<EventsListScreen> createState() => _EventsListScreenState();
}

class _EventsListScreenState extends State<EventsListScreen> {
  late final Dio _dio;
  bool _isLoading = true;
  DioException? _error;
  List<EventResponse> _events = [];

  @override
  void initState() {
    _dio = GetIt.I.get<Dio>();
    super.initState();
    _fetchEvents();
  }

  Future<void> _fetchEvents() async {
    try {
      _isLoading = true;

      final response = await _dio.get<List<dynamic>>('/events/');

      setState(() {
        _events = List.generate(
          response.data!.length,
              (index) => EventResponse.fromJson(
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
          title: const Text('IT-Мероприятия'),
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
            itemCount: _events.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: EventWidget(
                  image: _events[index].image,
                  date: _events[index].date.toLocal().toString().split(' ')[0],
                  members: _events[index].countPeople,
                  place: _events[index].city,
                  title: _events[index].title,
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Gap(12);
            },
          ),
        const SliverGap(12),
      ],
    );
  }
}
