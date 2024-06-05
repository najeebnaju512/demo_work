import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final IconData? icon;
  final ButtonStyle? style;
  final double? iconSize;
  final Color? iconColor;
  final double? height;
  final double? width;
  final VoidCallback? onPressed;
  final String? buttonText;
  final double? textFontSize;
  final Color? textColor;
  final WidgetStateProperty<Color?>? buttonColor;

  const CustomFilledButton({
    super.key,
    this.icon,
    this.style,
    this.iconSize,
    this.iconColor,
    this.height,
    this.width,
    this.onPressed,
    this.buttonText,
    this.textFontSize,
    this.textColor,
    this.buttonColor,
  }) : assert(icon != null || buttonText != null,
            'At least one value (icon or buttonText) must be provided.');

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: width,
      height: height,      child: FilledButton(
        style: ButtonStyle(
          backgroundColor: buttonColor ??
              WidgetStateProperty.all<Color>(Theme.of(context).primaryColor),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  6.0), // Rectangular shape with rounded corners
            ),
          ),
        ).merge(style),
        // .merge chetythal style il ulla all property avidey kittum

        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Icon(
                icon,
                size: iconSize,
                color: iconColor ?? Theme.of(context).primaryColor,
              ),
            if (icon != null && buttonText != null)
              SizedBox(width: size.width * .02), // Space between icon and text
            if (buttonText != null)
              Text(
                buttonText!,
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
