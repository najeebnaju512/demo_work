import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? onPressed;
  final Color? iconColor;
  final double? iconSize;

  const CustomIconButton(
      {super.key,
      this.icon,
      this.onPressed,
      this.iconColor,
      this.iconSize // Default icon size
      });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon,
          color: iconColor ?? Theme.of(context).primaryColor, size: iconSize),
      onPressed: onPressed,
    );
  }
}
