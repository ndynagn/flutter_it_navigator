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
              child: PrimaryCard(
                title: 'Новость',
                subtitle: 'Интересная',
                image: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.tiktok.com%2Fdiscover%2F%25D1%2582%25D0%25BE%25D0%25BC%25D0%25B0%25D1%2581-%25D1%2588%25D0%25B5%25D0%25BB%25D0%25B1%25D0%25B8-%25D0%25BC%25D0%25B5%25D0%25BC&psig=AOvVaw0OshgM3v5yfqOhUtMggVL2&ust=1732694438376000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCICqtvbD-YkDFQAAAAAdAAAAABAJ',
              ),
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
