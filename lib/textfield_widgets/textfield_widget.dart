import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final bool isEditable;
  final TextEditingController? controller;
  final Icon? suffixIcon;
  final void Function()? onSuffixIconPressed;

  TextFieldWidget({
    required this.isEditable,
    this.controller,
    this.suffixIcon,
    this.onSuffixIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: isEditable
          ? SizedBox(
              width: 293,
              height: 48,
              child: TextField(
                controller: controller,
                style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(
                      color: Theme.of(context).cardColor,
                      width: 1,
                    ),
                  ),
                  suffixIcon: suffixIcon != null
                      ? IconButton(
                          icon: suffixIcon!,
                          onPressed: onSuffixIconPressed,
                        )
                      : null,
                ),
              ),
            )
          : SizedBox(
              width: 487,
              height: 52,
              child: TextFormField(
                initialValue:
                    'Net 60 Days from Statement Date (Non-editable Text Field)',
                enabled: false,
                style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).primaryColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(
                      color: Theme.of(context).cardColor,
                      width: 1,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(
                      color: Theme.of(context).cardColor,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}