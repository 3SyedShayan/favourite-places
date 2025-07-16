import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  void _selectImage() {
  }
  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(border: Border.all(color: Colors.white),), height: 200, child: Center(child: IconButton(onPressed: () {
    _selectImage();
    }, icon: Icon(Icons.camera, color: Colors.white,)),),);
  }
}