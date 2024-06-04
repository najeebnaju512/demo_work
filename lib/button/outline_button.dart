import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final double? height;
  final double? width;
  final VoidCallback? onPressed;
  final String? buttonText;
  final double? textFontSize;
  final Color? textColor;

  const CustomOutlineButton(
      {super.key,
      this.icon,
      this.iconSize,
      this.iconColor,
      this.height,
      this.width,
      this.onPressed,
      this.buttonText,
      this.textFontSize,
      this.textColor}): assert(icon != null || buttonText != null, 'At least one value (icon or buttonText) must be provided.');

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  6.0), // Rectangular shape with rounded corners
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Icon(
                icon,
                size: iconSize,
                color: iconColor??Theme.of(context).primaryColor,
              ),
            if (icon != null && buttonText != null)
              SizedBox(width: size.width * 0.03),
            if (buttonText != null)
              Text(
                buttonText ?? "",
                style: TextStyle(
                    fontSize: textFontSize,
                    color: textColor ?? Theme.of(context).primaryColor),
              ),
          ],
        ),
      ),
    );
  }
}
