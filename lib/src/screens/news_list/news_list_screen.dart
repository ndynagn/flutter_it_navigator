import 'package:flutter/material.dart';
import 'package:flutter_it_navigator/src/common/primary_card.dart';
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
        const SliverAppBar(
          pinned: true,
          title: Text('Новости'),
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
