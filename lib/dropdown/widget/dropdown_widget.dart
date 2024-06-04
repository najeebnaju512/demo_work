import 'package:flutter/material.dart';

class DropdownWidget extends StatelessWidget {
   DropdownWidget({
    super.key,
  });

  final List<String> list = ['Sales Type 1', 'Sales Type 2', 'Sales Type 3', 'Sales Type 4', 'Sales Type 5'];


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 532,
      color: Colors.blue,
      child: DropdownButtonFormField(
        style: TextStyle(fontSize: 15),

        borderRadius: BorderRadius.circular(5),
        decoration:const InputDecoration(
            isDense: true,
            fillColor: Colors.white,
            hintText: "Sales Type",
            hintStyle: TextStyle(color: Colors.black),
            contentPadding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
            border: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(100, 203, 203, 203))),
            enabled: false,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(100, 203, 203, 203))
            )
        ),
        icon: IntrinsicWidth(
          child: Row(
            children: [
              FilledButton(
                onPressed: () => null, child: Icon(Icons.add,size: 14,),
                style: ButtonStyle(
                  minimumSize: WidgetStateProperty.all<Size>(Size(35,50)),
                  padding: WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
                  backgroundColor: WidgetStateProperty.all<Color>(Theme.of(context).primaryColor),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),

                ),),
              SizedBox(width: 15,),
              Icon(Icons.arrow_drop_down)
            ],
          ),
        ),
        items: list.map( (e) => DropdownMenuItem(child: Text("$e",style: TextStyle(fontSize: 15),),value: e,),).toList(),
        onChanged: (value) => null,),
    );
  }
}
