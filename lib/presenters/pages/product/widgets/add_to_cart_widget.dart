import 'package:flutter/material.dart';

class AddToCartWidget extends StatelessWidget {
  final bool isLoading;
  final void Function() onTap;
  final String text;
  const AddToCartWidget({
    super.key,
    required this.isLoading,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton.icon(
        onPressed: isLoading ? null : onTap,
        icon: const Icon(Icons.shopping_cart),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 235, 143, 5),
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
