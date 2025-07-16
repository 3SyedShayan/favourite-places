import 'package:favorite_places/riverpod/favorite_places.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceDetail extends ConsumerStatefulWidget {
  const PlaceDetail({super.key});

  @override
  ConsumerState<PlaceDetail> createState() => _PlaceDetailState();
}

class _PlaceDetailState extends ConsumerState<PlaceDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [
     Text(ref.read(favoritePlaces)[0].title, style: TextStyle(fontSize: 24, color: Colors.white)),
      ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text("Back to Home", style: Theme.of(context).textTheme.titleLarge,),
      ),
      // Add more UI elements as needed
    ],),);
  }
}