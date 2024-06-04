import 'package:flutter/material.dart';
import 'package:demo_work/textfield_widgets/colors/color_constants.dart';

class EditTextField extends StatelessWidget {
  final Icon? suffixIcon;
  final TextEditingController? controller;
  final void Function()? onSuffixIconPressed;

  EditTextField({
    this.suffixIcon,
    this.controller,
    this.onSuffixIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: SizedBox(
        width: 293,
        height: 48,
        child: TextField(
          controller: controller,
          style: TextStyle(
            color: ColorConstants.black,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                color: ColorConstants.textBorder,
                width: 1,
              ),
            ),
            suffixIcon: suffixIcon != null
                ? IconButton(
                    icon: suffixIcon!,
                    onPressed: onSuffixIconPressed,
                  )
                : null,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                color: ColorConstants.textBorder,
                width: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
