import 'package:flutter/material.dart';

class OrganizationsListScreen extends StatefulWidget {
  const OrganizationsListScreen({super.key});

  @override
  State<OrganizationsListScreen> createState() => _OrganizationsListScreenState();
}

class _OrganizationsListScreenState extends State<OrganizationsListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Column(
        children: [
          Text('Organization'),
        ],
      ),
    );
  }
}
