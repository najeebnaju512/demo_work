import 'dart:developer';

import 'package:demo_work/textfield_widgets/edit_textfield.dart';
import 'package:demo_work/textfield_widgets/conditional_textfield.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        useMaterial3: true,
        primaryColor: Color(0XFFFAFAFA),
        cardColor: Color(0XFFCBCBCB),
        primaryColorDark: Color(0XFF000000),
        primaryColorLight: Color(0XFFFFFFFF)),
    home: Scaffold(
      body: Center(
        child: ExampleMain(),
      ),
    ),
  ));
}

class ExampleMain extends StatefulWidget {
  ExampleMain({super.key});

  @override
  State<ExampleMain> createState() => _ExampleMainState();
}

class _ExampleMainState extends State<ExampleMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            EditTextField(
                // controller: _controller,
                ),
            SizedBox(
              height: 20,
            ),
            ConditionalTextField(
              isEditable: true,
              suffixIcon: Icon(Icons.add),
              onSuffixIconPressed: () {
                log("-----------");
              },
            ),
            SizedBox(
              height: 20,
            ),
            ConditionalTextField(
              isEditable: false,
            )
          ],
        ),
      ),
    );
  }
}
