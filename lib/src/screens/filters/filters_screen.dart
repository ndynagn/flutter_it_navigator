import 'package:flutter/material.dart';
import 'package:flutter_it_navigator/src/common/primary_elevated_button.dart';
import 'package:flutter_it_navigator/src/screens/filters/models/filter_model.dart';
import 'package:gap/gap.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  final _selectedFilters = <String>{};
  final _filters = const [
    FilterModel(
      id: 1,
      title: 'Продукт',
      value: 'product',
    ),
    FilterModel(
      id: 1,
      title: 'IT Бизнес',
      value: 'it_business',
    ),
    FilterModel(
      id: 1,
      title: 'Стартапы',
      value: 'startup',
    ),
    FilterModel(
      id: 1,
      title: 'Маркетинг',
      value: 'marketing',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: const Text('Фильтры'),
            actions: [
              TextButton(
                onPressed: () {
                  setState(
                    _selectedFilters.clear,
                  );
                },
                child: const Text('Сбросить'),
              ),
            ],
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
          SliverList.builder(
            itemCount: _filters.length,
            itemBuilder: (context, index) {
              return CheckboxListTile(
                title: Text(_filters[index].title),
                value: _selectedFilters.contains(
                  _filters[index].value,
                ),
                onChanged: (value) {
                  if (_selectedFilters.contains(
                    _filters[index].value,
                  )) {
                    setState(() {
                      _selectedFilters.remove(
                        _filters[index].value,
                      );
                    });
                  } else {
                    setState(() {
                      _selectedFilters.add(
                        _filters[index].value,
                      );
                    });
                  }
                },
              );
            },
          ),
          const SliverToBoxAdapter(
            child: Divider(),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: SafeArea(
              top: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                    bottom: 12,
                  ),
                  child: PrimaryElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Закрыть'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
