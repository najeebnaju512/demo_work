import 'dart:io';
import 'package:demo_work/dropdown/widget/dropdown_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:image_picker/image_picker.dart';

class SimpleDropdownWidget extends StatefulWidget {
   SimpleDropdownWidget({super.key});

  @override
  State<SimpleDropdownWidget> createState() => _SimpleDropdownWidgetState();
}

class _SimpleDropdownWidgetState extends State<SimpleDropdownWidget> {
   final ImagePicker _picker = ImagePicker();

   File? _image;
   Uint8List? _webImage;
   late DropzoneViewController _controller;

   Future<void> _pickImage(ImageSource source) async {
     final XFile? img = await _picker.pickImage(source: source);


     if (img != null) {
       if (kIsWeb) {
         final bytes = await img.readAsBytes();
         setState(() {
           _webImage = bytes;
         });
       } else {
         setState(() {
           _image = File(img.path);
         });
       }
     } else {
       print('No image selected.');
     }
   }
   void _onDropFile(dynamic event) async {
     if (kIsWeb) {
       final bytes = await _controller.getFileData(event);
       setState(() {
         _webImage = bytes;
       });
     }
   }

   removeImage(){
     setState(() {
       _image = null;
       _webImage = null;
     });
   }


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              Text("Dropdown Menu Items"),
             const SizedBox(
                height: 20,
              ),
              DropdownWidget(),
              SizedBox(height: 30,),
              DottedBorder(
                borderType: BorderType.RRect,
                color: Colors.grey,
                dashPattern: const [6,6],
                radius:const Radius.circular(12),
                child: Container(
                  height: 345,
                  width: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      DropzoneView(
                        onDrop: _onDropFile,
                        onCreated: (controller) => _controller = controller,
                        operation: DragOperation.copy,
                        cursor: CursorType.grab,
                      ),
                      _webImage == null && _image==null ? Align(
                        alignment: Alignment(0,0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Add Image",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                            SizedBox(height: 8,),
                            GestureDetector(
                              onTap: () => _pickImage(ImageSource.gallery),
                              child: Container(
                                height: 38,
                                width: 38,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.black,width: 2)
                                ),
                                child: Center(child: Icon(Icons.add,size: 28,),),
                              ),
                            ),
                            SizedBox(height: 8,),
                            Text("Drag and drop or choose file to upload",style: TextStyle(fontSize: 9,fontWeight: FontWeight.w500),),
                          ],
                        ),
                      )
                      : Align(
                        alignment: Alignment(0,0),
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              image: DecorationImage(image: (_webImage != null)
                                  ? MemoryImage(_webImage!) as ImageProvider
                                  : (_image != null)
                                  ? FileImage(_image!)
                                  : AssetImage('assets/noimage.png'),)
                          ),
                        ),
                      )
                      ,
                      Align(
                          alignment: Alignment(0.9, -0.9),
                          child: IconButton(color: Colors.grey, onPressed: () => removeImage(), icon:Icon(Icons.delete),))
          
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    ) ;
  }
}

