import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function onTap;

  const CustomRadioButton({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return InkWell(
      onTap: () => onTap(),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 8.0),
            height: 24.0,
            width: 24.0,
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue : Colors.grey,
              border: Border.all(
                color: isSelected ? Colors.white : Colors.white,
                width: 5.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: isSelected
                ? Center(
              child: Container(
                height: 12.0,
                width: 12.0,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(6.0),
                ),
              ),
            )
                : null,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 18.0,
              color: isSelected ? Colors.black : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
