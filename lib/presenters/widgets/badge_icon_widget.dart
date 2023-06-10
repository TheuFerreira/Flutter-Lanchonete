import 'package:flutter/material.dart';

class BadgeIconWidget extends StatelessWidget {
  final String? value;
  final Color badgeColor;
  final Icon iconData;
  final void Function() onTap;
  const BadgeIconWidget({
    super.key,
    this.value,
    this.badgeColor = Colors.green,
    required this.iconData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
          onPressed: onTap,
          icon: iconData,
        ),
        if (value == null)
          Container()
        else
          Positioned(
            right: 6,
            top: 6,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.brightness_1,
                  size: 20.0,
                  color: badgeColor,
                ),
                Positioned(
                  top: 3.0,
                  right: 4.0,
                  child: Center(
                    child: Text(
                      value!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
