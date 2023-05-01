import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  final void Function() onTap;
  final IconData icon;
  const RoundedButtonWidget({
    super.key,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        height: 28,
        width: 28,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(
          icon,
          size: 18,
          color: Colors.black,
        ),
      ),
    );
  }
}
