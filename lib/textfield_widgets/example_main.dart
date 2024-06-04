import 'package:demo_work/textfield_widgets/edit_textfield.dart';
import 'package:demo_work/textfield_widgets/conditional_textfield.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
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
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            EditTextField(
              // controller: _controller,
            ),
            SizedBox(
              height: 20,
            ),
            ConditionalTextField(isEditable: true),
            SizedBox(
              height: 20,
            ),
            ConditionalTextField(isEditable: false)
          ],
        ),
      ),
    );
  }
}
