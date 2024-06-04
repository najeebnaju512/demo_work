import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CustomDatepickerWidget extends StatelessWidget {
  const CustomDatepickerWidget(
      {super.key, required this.controller, required this.hinttext});
  final TextEditingController controller;
  final String hinttext;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLength: 10,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_today),
          onPressed: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
            );
            if (pickedDate != null) {
              controller.text = DateFormat('yyyy/MM/dd').format(pickedDate);
            }
          },
        ),
        hintText: hinttext,
        hintStyle: Theme.of(context).textTheme.labelLarge,
        border: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary, width: 3.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary, width: 2.0),
        ),
      ),
      inputFormatters: [DateInputFormatter()],
      keyboardType: TextInputType.number,
      onSubmitted: (value) {
        DateTime parsedDate = DateFormat('yyyy/MM/dd').parse(value);
        controller.text = DateFormat('yyyy/MM/dd').format(parsedDate);
      },
    );
  }
}

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final StringBuffer newText = StringBuffer();
    for (int i = 0; i < newValue.text.length; i++) {
      if ((i == 4 || i == 7) && newValue.text[i] != '/') {
        newText.write('/');
      }
      if (_isNumeric(newValue.text[i]) || newValue.text[i] == '/') {
        newText.write(newValue.text[i]);
      }
    }
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }

  bool _isNumeric(String s) {
    return double.tryParse(s) != null;
  }
}
