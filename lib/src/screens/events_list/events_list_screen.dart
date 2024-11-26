import 'package:flutter/material.dart';
import 'package:flutter_it_navigator/src/screens/events_list/widgets/event_widget.dart';
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
        const SliverAppBar(
          pinned: true,
          title: Text('IT-Мероприятия'),
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
              )
            );
          },
          separatorBuilder: (context, index) {
            return const Gap(12);
          },
        ),
      ],
    );
  }
}
