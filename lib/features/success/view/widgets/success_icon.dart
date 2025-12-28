import 'package:flutter/material.dart';

class SuccessIcon extends StatelessWidget {
  const SuccessIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 48,
      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      child: Icon(
        Icons.check_circle,
        color: Theme.of(context).colorScheme.primary,
        size: 64,
      ),
    );
  }
}
