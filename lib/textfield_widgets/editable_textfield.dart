import 'package:demo_work/textfield_widgets/colors/color_constants.dart';
import 'package:flutter/material.dart';

class EditableTextField extends StatelessWidget {
  final TextEditingController? textEditController;
  final Icon? suffixIcon;
  final void Function()? onSuffixIconPressed;

  const EditableTextField(
      {super.key,
      this.textEditController,
      this.suffixIcon,
      this.onSuffixIconPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 293,
      height: 48,
      child: TextField(
        controller: textEditController ?? TextEditingController(),
//refactor this to take value which is not required
//also add a suffix button which is also not required

        style: TextStyle(
            color: ColorConstants.black,
            fontWeight: FontWeight.w400,
            fontSize: 14),

        //sf pro display google fonts add cheyanm
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorConstants.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(
              color: ColorConstants.textBorder,
              width: 1,
            ),
          ),
          suffixIcon: InkWell(onTap: onSuffixIconPressed, child: suffixIcon),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(
              color: ColorConstants.textBorder,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
