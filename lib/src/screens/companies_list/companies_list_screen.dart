import 'package:flutter/material.dart';
import 'package:flutter_it_navigator/src/screens/filters/filters_screen.dart';
import 'package:flutter_it_navigator/src/screens/profile/profile_screen.dart';

class CompaniesListScreen extends StatefulWidget {
  const CompaniesListScreen({super.key});

  @override
  State<CompaniesListScreen> createState() => _CompaniesListScreenState();
}

class _CompaniesListScreenState extends State<CompaniesListScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text('Компании'),
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
        SliverList.builder(
          itemBuilder: (context, index) {
            return const Text('data');
          },
        ),
      ],
    );
  }
}
