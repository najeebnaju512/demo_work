import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const SampleHome());
}

class SampleHome extends StatefulWidget {
  const SampleHome({super.key});

  @override
  State<SampleHome> createState() => _SampleHomeState();
}

class _SampleHomeState extends State<SampleHome> {
  late TextEditingController dateController;

  @override
  void initState() {
    super.initState();
    dateController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 80,
                  width: 300,
                  child: Center(
                      child: DatepickerWidget(
                          controller: dateController,
                          hinttext: 'Limit Validity'))),
              IconButton(
                onPressed: () {
                  log(dateController.text);
                  
                },
                icon: const Icon(Icons.calendar_today),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DatepickerWidget extends StatelessWidget {
  const DatepickerWidget(
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
