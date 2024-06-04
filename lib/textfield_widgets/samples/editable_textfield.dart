// import 'package:demo_work/textfield_widgets/colors/color_constants.dart';
// import 'package:flutter/material.dart';


// // using statefullwidget
// class EditableTextField extends StatefulWidget {
//   final TextEditingController? textEditController;
//   final Icon? suffixIcon;
//   final void Function()? onSuffixIconPressed;

//   const EditableTextField({
//     super.key,
//     this.textEditController,
//     this.suffixIcon,
//     this.onSuffixIconPressed,
//   });

//   @override
//   _EditableTextFieldState createState() => _EditableTextFieldState();
// }

// class _EditableTextFieldState extends State<EditableTextField> {
//   late TextEditingController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = widget.textEditController ?? TextEditingController();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 293,
//       height: 48,
//       child: TextField(
//         controller: _controller,
//         style:  TextStyle(
//           color: ColorConstants.black,
//           fontWeight: FontWeight.w400,
//           fontSize: 14,
//         ),
//         decoration: InputDecoration(
//           filled: true,
//           fillColor: ColorConstants.white,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(6),
//             borderSide:  BorderSide(
//               color: ColorConstants.textBorder,
//               width: 1,
//             ),
//           ),
//           suffixIcon: InkWell(
//             onTap: widget.onSuffixIconPressed,
//             child: widget.suffixIcon,
//           ),
//           disabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(6),
//             borderSide:  BorderSide(
//               color: ColorConstants.textBorder,
//               width: 1,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     if (widget.textEditController == null) {
//       _controller.dispose();
//     }
//     super.dispose();
//   }
// }



  
