import 'package:flutter/material.dart';

class FavoriteButtonWidget extends StatelessWidget {
  final bool favorited;
  final void Function() onTap;
  const FavoriteButtonWidget({
    super.key,
    required this.favorited,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Icon(
          favorited ? Icons.favorite_outlined : Icons.favorite_border,
          size: 26,
          color: const Color.fromARGB(255, 235, 143, 5),
        ),
      ),
    );
  }
}
