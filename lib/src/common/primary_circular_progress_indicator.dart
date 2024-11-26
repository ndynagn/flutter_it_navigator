import 'package:flutter/material.dart';

class PrimaryCircularProgressIndicator extends StatelessWidget {
  const PrimaryCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      strokeCap: StrokeCap.round,
    );
  }
}
