import 'package:flutter/material.dart';
import 'package:flutter_it_navigator/src/screens/events_list/widgets/event_widget.dart';
import 'package:flutter_it_navigator/src/screens/filters/filters_screen.dart';
import 'package:flutter_it_navigator/src/screens/profile/profile_screen.dart';
import 'package:gap/gap.dart';

class EventsListScreen extends StatefulWidget {
  const EventsListScreen({super.key});

  @override
  State<EventsListScreen> createState() => _EventsListScreenState();
}

class _EventsListScreenState extends State<EventsListScreen> {
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
        SliverList.separated(
          itemBuilder: (context, index) {
            return const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: EventWidget(
                  date: '13 April 2025',
                  members: 52,
                  place: 'Omsk',
                  title: 'IT - Субботник',
                ));
          },
          separatorBuilder: (context, index) {
            return const Gap(12);
          },
        ),
      ],
    );
  }
}
