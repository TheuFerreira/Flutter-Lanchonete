import 'package:flutter/material.dart';
import 'package:lanchonete_app/domain/responses/label_response.dart';

class LabelWidget extends StatelessWidget {
  final LabelResponse label;
  final bool hasMargin;
  const LabelWidget({
    super.key,
    required this.label,
    required this.hasMargin,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                Image.memory(
                  label.photo!,
                  width: 22,
                  height: 22,
                ),
                const SizedBox(width: 4),
                Text(
                  label.description,
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
        ),
        if (hasMargin) const SizedBox(width: 12),
      ],
    );
  }
}
