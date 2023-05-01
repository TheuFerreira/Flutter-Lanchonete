import 'package:flutter/material.dart';

class DotWidget extends StatelessWidget {
  final Color color;
  const DotWidget({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
