import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class ImageInput extends StatefulWidget {
  ImageInput({super.key, required this.onPickImage});

void Function(File image) onPickImage;
  @override
  State<ImageInput> createState() => _ImageInputState();

}

class _ImageInputState extends State<ImageInput> {
    File? selectedImage;
  void _selectImage() async {
    var imagePicker = ImagePicker();
    var pickedImage = await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 600 );
    if (pickedImage == null) {
      return;
    }

    setState(() {
      
    selectedImage = File(pickedImage.path);
    });
    print(selectedImage!.path);
    widget.onPickImage(selectedImage!);
  }
  @override
  Widget build(BuildContext context) {
    Widget content = IconButton(icon: Icon(Icons.camera, color: Colors.white,),
      onPressed: () {
    _selectImage();
    }, );
    if (selectedImage != null) {
      content = GestureDetector(
        onTap: _selectImage,
        child: Image.file(selectedImage!,
          fit: BoxFit.cover, height: double.infinity,),
      );
    }
    return Container(decoration: BoxDecoration(border: Border.all(color: Colors.white),), height: 200, child: Center(child: content,),);
  }
}