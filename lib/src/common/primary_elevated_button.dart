import 'package:flutter/material.dart';
import 'package:flutter_it_navigator/src/common/primary_circular_progress_indicator.dart';

class PrimaryElevatedButton extends StatelessWidget {
  const PrimaryElevatedButton({
    super.key,
    this.isLoading = false,
    required this.onPressed,
    required this.child,
  });

  final bool isLoading;
  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 14,
        ),
        child: Visibility(
          visible: !isLoading,
          replacement: const SizedBox(
            width: 18,
            height: 18,
            child: PrimaryCircularProgressIndicator(),
          ),
          child: child,
        ),
      ),
    );
  }
}
