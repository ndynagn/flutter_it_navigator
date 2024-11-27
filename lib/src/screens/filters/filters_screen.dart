import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            title: Text('Фильтры'),
          ),
          const SliverGap(24),
          const SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
            ),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  Text(
                    'Категории',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverGap(12),
          SliverToBoxAdapter(
            child: CheckboxListTile(
              title: const Text('Продукт'),
              value: true,
              onChanged: (value) {},
            ),
          ),
          SliverToBoxAdapter(
            child: CheckboxListTile(
              title: const Text('IT Бизнес'),
              value: true,
              onChanged: (value) {},
            ),
          ),
          SliverToBoxAdapter(
            child: CheckboxListTile(
              title: const Text('Стартапы'),
              value: true,
              onChanged: (value) {},
            ),
          ),
          SliverToBoxAdapter(
            child: CheckboxListTile(
              title: const Text('Маркетинг'),
              value: true,
              onChanged: (value) {},
            ),
          ),
          const SliverToBoxAdapter(
            child: Divider(),
          ),
          const SliverGap(12),
        ],
      ),
    );
  }
}
