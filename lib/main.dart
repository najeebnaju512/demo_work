import 'package:demo_work/button/filled_button.dart';
import 'package:demo_work/button/icon_button.dart';
import 'package:demo_work/button/outline_button.dart';
import 'package:demo_work/button/radio_button.dart';
import 'package:demo_work/date_picker/date_picker.dart';
import 'package:demo_work/dropdown/widget/dropdown_widget.dart';
import 'package:demo_work/search_bar.dart';
import 'package:demo_work/textfield_widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'dropdown/image_picker.dart';
import 'model.dart';

List<dynamic> suggestions = [
  SampleModel(lastname: "muhammed", firstname: " najeeb"),
  SampleModel(lastname: "duglas", firstname: " sajin"),
  SampleModel(lastname: "duglas", firstname: "amos"),
  SampleModel(lastname: "duglas", firstname: "anush"),
];

final List<String> dropList = [
  'Sales Type 1',
  'Sales Type 2',
  'Sales Type 3',
  'Sales Type 4',
  'Sales Type 5'
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: MyHome());
  }
}

class MyHome extends StatelessWidget {
  MyHome({super.key});
  TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: size.width * .5,
            child: Column(
              children: [
                const Row(
                  children: [
                    CustomIconButton(
                      icon: Icons.arrow_back,
                    ),
                    Expanded(
                      child: SizedBox(
                        child: SearchWidget(
                          hintText: "What Are You Seeking For?",
                        ),
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomOutlineButton(
                      icon: Icons.play_arrow,
                      buttonText: "Preview",
                    ),
                    CustomFilledButton(
                      icon: Icons.save,
                      buttonText: "Save",
                    ),
                    CustomIconButton(
                      icon: Icons.abc,
                    )
                  ],
                ),
                CustomDropDown(list: dropList),
                CustomDatepickerWidget(
                    controller: dateController, hinttext: "Limit Validity"),
                const CustomTextFieldWidget(
                    isEditable: true, hinttext: "Limit Validity"),
                const CustomTextFieldWidget(
                    isEditable: false,
                    hinttext:
                        'Net 60 Days from Statement Date (Non-editable Text Field)'),
                Row(
                  children: [
                    CustomRadioButton(
                        text: "Unlimited", isSelected: true, onTap: () {}),
                    CustomRadioButton(
                        text: "Unlimited", isSelected: false, onTap: () {}),
                    const CustomFilledButton(
                      icon: Icons.add,
                      iconSize: 20,
                    ),
                    const CustomFilledButton(
                      icon: Icons.add,
                      iconSize: 20,
                      buttonText: "Add Another Field",
                      width: 200,
                      textFontSize: 14,
                    )
                  ],
                )
              ],
            ),
          ),
          const CustomImagePicker()
        ],
      ),
    );
  }
}
