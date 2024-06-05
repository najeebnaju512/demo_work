import 'dart:developer';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker extends StatefulWidget {
  const CustomImagePicker({super.key});

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
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
      log('No image selected.');
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

  removeImage() {
    setState(() {
      _image = null;
      _webImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      color: Colors.grey,
      dashPattern: const [6, 6],
      radius: const Radius.circular(12),
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
            _webImage == null && _image == null
                ? Align(
                    alignment: const Alignment(0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Add Image",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        GestureDetector(
                          onTap: () => _pickImage(ImageSource.gallery),
                          child: Container(
                            height: 38,
                            width: 38,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.black, width: 2)),
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                size: 28,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Drag and drop or choose file to upload",
                          style: TextStyle(
                              fontSize: 9, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  )
                : Align(
                    alignment: const Alignment(0, 0),
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: (_webImage != null)
                            ? MemoryImage(_webImage!) as ImageProvider
                            : (_image != null)
                                ? FileImage(_image!)
                                : const AssetImage('assets/noimage.png'),
                      )),
                    ),
                  ),
            Align(
                alignment: const Alignment(0.9, -0.9),
                child: IconButton(
                  color: Colors.grey,
                  onPressed: () => removeImage(),
                  icon: const Icon(Icons.delete),
                ))
          ],
        ),
      ),
    );
  }
}
