import 'package:flutter/material.dart';
import 'package:flutter_it_navigator/src/common/primary_card.dart';
import 'package:flutter_it_navigator/src/screens/filters/filters_screen.dart';
import 'package:gap/gap.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
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
        SliverList.separated(
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: PrimaryCard(),
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
