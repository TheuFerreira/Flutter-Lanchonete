import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  const InfoWidget({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: Colors.grey[600],
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(color: Colors.grey[600]),
        ),
      ],
    );
  }
}
