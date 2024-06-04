import 'package:demo_work/textfield_widgets/colors/color_constants.dart';
import 'package:flutter/material.dart';

class NonEditableTextField extends StatelessWidget {
  const NonEditableTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 487,
      height: 52,
      child: TextField(
        controller: TextEditingController(
            text: 'Net 60 Days from Statement Date (Non-editable Text Field)'),
        enabled: false,
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
