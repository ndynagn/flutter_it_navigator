import 'package:flutter/material.dart';
import 'package:flutter_it_navigator/src/screens/filters/filters_screen.dart';
import 'package:flutter_it_navigator/src/common/primary_card.dart';
import 'package:gap/gap.dart';

class EducationListScreen extends StatefulWidget {
  const EducationListScreen({super.key});

  @override
  State<EducationListScreen> createState() =>
      _EducationListScreenState();
}

class _EducationListScreenState extends State<EducationListScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          title: const Text('Образование'),
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
              child: PrimaryCard(
                title: 'Колледж',
                subtitle: 'Омавиат',
                image: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fleader-id.ru%2Fen%2Fevents%2F511644&psig=AOvVaw3BoWrJPFloGp-931PYmcHF&ust=1732694368841000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCJCMtNnD-YkDFQAAAAAdAAAAABAE',
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
