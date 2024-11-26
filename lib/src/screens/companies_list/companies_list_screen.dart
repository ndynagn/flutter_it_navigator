import 'package:flutter/material.dart';

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
          title: Text('Gay'),
        ),
        SliverList.builder(
          itemBuilder: (context, index) {
            return Text('data');
          },
        ),
      ],
    );
  }
}
