import 'package:flutter/material.dart';
import 'package:flutter_it_navigator/src/screens/filters/filters_screen.dart';

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
      ],
    );
  }
}
