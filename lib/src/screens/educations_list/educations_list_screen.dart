import 'package:flutter/material.dart';

class EducationsListScreen extends StatefulWidget {
  const EducationsListScreen({super.key});

  @override
  State<EducationsListScreen> createState() => _EducationsListScreenState();
}

class _EducationsListScreenState extends State<EducationsListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Column(
        children: [
          Text('Educ'),
        ],
      ),
    );
  }
}
