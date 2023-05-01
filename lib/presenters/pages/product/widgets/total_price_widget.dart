import 'package:flutter/material.dart';
import 'package:lanchonete_app/presenters/pages/product/widgets/shimmer_widget.dart';

class TotalPriceWidget extends StatelessWidget {
  final bool isLoading;
  final String value;
  const TotalPriceWidget({
    super.key,
    required this.isLoading,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Preço total',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        ShimmerWidget(
          isLoading: isLoading,
          width: 89,
          height: 26,
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
