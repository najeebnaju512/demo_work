import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final bool isEditable;
  final TextEditingController? controller;
  final Icon? suffixIcon;
  final void Function()? onSuffixIconPressed;
  final String? hinttext;

  const CustomTextFieldWidget({
    super.key,
    required this.isEditable,
    this.controller,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.hinttext,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      child: isEditable
          ? SizedBox(
              width: size.width * .34,
              height: size.height * .1,
              // width: 293,
              // height: 48,
              child: TextField(
                controller: controller,
                style: TextStyle(
                  color: Theme.of(context)
                      .primaryColorDark, //define in main these colors
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  hintText: hinttext,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(
                      color: Theme.of(context)
                          .cardColor, //define in main these colors
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
              width: size.width * .55,
              height: size.height * .1,
              // width: 487,
              // height: 52,
              child: TextFormField(
                initialValue: hinttext,
                enabled: false,
                style: TextStyle(
                  color: Theme.of(context)
                      .primaryColorDark, //define in main these colors
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).primaryColorLight,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(
                      color: Theme.of(context)
                          .cardColor, //define in main these colors
                      width: 1,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(
                      color: Theme.of(context)
                          .cardColor, //define in main these colors
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
