import 'package:flutter/material.dart';
import 'package:lanchonete_app/domain/responses/label_response.dart';

class LabelWidget extends StatelessWidget {
  final LabelResponse label;
  final bool hasMargin;
  final bool isSelected;
  final Color? selectedBackgrounColor;
  final Color? selectedTextColor;
  final void Function(LabelResponse label)? onTap;
  const LabelWidget({
    super.key,
    required this.label,
    required this.hasMargin,
    this.onTap,
    this.isSelected = false,
    this.selectedBackgrounColor,
    this.selectedTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: () {
            if (onTap != null) {
              onTap!(label);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: isSelected ? selectedBackgrounColor : Colors.grey[300],
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
                  style: TextStyle(
                    fontSize: 13,
                    color: isSelected ? selectedTextColor : Colors.black,
                  ),
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
