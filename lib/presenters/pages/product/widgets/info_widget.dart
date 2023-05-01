import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool show;
  final bool hasMargin;
  const InfoWidget({
    super.key,
    required this.text,
    required this.icon,
    this.show = true,
    this.hasMargin = true,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: show,
      child: Row(
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
          if (hasMargin) const SizedBox(width: 12),
        ],
      ),
    );
  }
}
