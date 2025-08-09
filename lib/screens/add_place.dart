import 'dart:io';

import 'package:favorite_places/riverpod/favorite_places.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'package:favorite_places/widgets/locations_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlace extends ConsumerStatefulWidget {
  const AddPlace({super.key});

  @override
  ConsumerState<AddPlace> createState() => AddPlaceState();
}

class AddPlaceState extends ConsumerState<AddPlace> {
  File? selectedImage;
  String? locationName;
  var titleController = TextEditingController();
  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  void addPlace() {
    if (titleController.text.isNotEmpty || selectedImage != null) {
      ref
          .read(favoritePlaces.notifier)
          .addString(titleController.text, selectedImage!, locationName!);
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please enter a place name")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Place"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          TextFormField(
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
            ), // Use theme color
            controller: titleController,

            decoration: InputDecoration(
              hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
              ),

              labelText: 'Place Name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          ImageInput(
            onPickImage: (image) {
              setState(() {
                selectedImage = image;
              });
            },
          ),
          SizedBox(height: 20),
          LocationInput(
            onSelectLocation: (location) {
              locationName = location;
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              addPlace();
            },
            child: Text("Add Place"),
          ),
        ],
      ),
    );
  }
}
