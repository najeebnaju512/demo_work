import 'package:demo_work/textfield_widgets/editable_textfield.dart';
import 'package:demo_work/textfield_widgets/non_editable_textfield.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: Sample(),
      ),
    ),
  ));
}
class Sample extends StatelessWidget {
  const Sample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            EditableTextField(suffixIcon: Icon(Icons.add),),
            SizedBox(
              height: 20,
            ),
            NonEditableTextField()
          ],
        ),
      ),
    );
  }
}
