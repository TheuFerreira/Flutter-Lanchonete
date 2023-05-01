import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:lanchonete_app/presenters/pages/product/widgets/dots_slider_widget.dart';

class CarousellImageWidget extends StatelessWidget {
  final double width;
  final double height;
  final List<Uint8List>? images;
  final int selectedImage;
  final void Function(int) onSlider;
  const CarousellImageWidget({
    super.key,
    required this.width,
    required this.height,
    required this.images,
    required this.selectedImage,
    required this.onSlider,
  });

  @override
  Widget build(BuildContext context) {
    final hasImage = images != null;
    return SizedBox(
      width: double.infinity,
      height: 400 - 24,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (hasImage) _carousell() else _load(),
          Positioned(
            bottom: 1,
            left: 1,
            right: 1,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: DotsSliderWidget(
                baseColor: Colors.grey[300]!.withOpacity(0.3),
                selectedColor: Colors.grey[100]!.withOpacity(0.6),
                selected: selectedImage,
                max: hasImage ? images!.length : 0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _load() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 50,
          width: 50,
          child: CircularProgressIndicator(
            backgroundColor: Colors.grey[300],
            color: Colors.grey[100],
          ),
        ),
      ],
    );
  }

  Widget _carousell() {
    return PageView.builder(
      itemCount: images!.length,
      onPageChanged: onSlider,
      itemBuilder: (itemBuilder, i) {
        final photo = images![i];
        return Image.memory(
          photo,
          fit: BoxFit.cover,
        );
      },
    );
  }
}
