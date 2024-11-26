import 'package:flutter/material.dart';

class EducationListScreen extends StatefulWidget {
  const EducationListScreen({super.key});

  @override
  State<EducationListScreen> createState() =>
      _EducationListScreenState();
}

class _EducationListScreenState extends State<EducationListScreen> {
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          title: Text('Образование'),
        ),
      ],
    );
  }
}
