import 'package:flutter/material.dart';
import 'package:lanchonete_app/presenters/pages/product/widgets/dot_widget.dart';

class DotsSliderWidget extends StatelessWidget {
  final Color baseColor;
  final Color selectedColor;
  final int max;
  final int selected;
  const DotsSliderWidget({
    super.key,
    required this.baseColor,
    required this.selectedColor,
    this.max = 3,
    this.selected = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < max; i++) _dot(i),
      ],
    );
  }

  Widget _dot(int index) {
    final isSelected = index == selected;
    return Row(
      children: [
        DotWidget(
          color: isSelected ? selectedColor : baseColor,
        ),
        if (index < max - 1) const SizedBox(width: 8),
      ],
    );
  }
}
