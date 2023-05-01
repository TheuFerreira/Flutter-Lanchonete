import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final bool isLoading;
  final double height;
  final double width;
  final Widget child;
  const ShimmerWidget({
    super.key,
    this.isLoading = false,
    this.height = 26.0,
    this.width = double.infinity,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SizedBox(
        width: width,
        height: height,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(color: Colors.white),
        ),
      );
    }

    return child;
  }
}
