import 'package:favorite_places/riverpod/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlace extends ConsumerStatefulWidget {
  const AddPlace({super.key});

  @override
  ConsumerState<AddPlace> createState() => AddPlaceState();
}

class AddPlaceState extends ConsumerState<AddPlace> {
  var titleController = TextEditingController();
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
          Text("Add Place Screen"),
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: 'Place Name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              print("Place Added: ${titleController.text}");
      ref.read(favoritePlaces.notifier).addString(titleController.text);
              Navigator.pop(context);
            },
            child: Text("Add Place"),
          ),
        ],
      ),
    );
  }
}
