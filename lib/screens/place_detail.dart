import 'package:favorite_places/riverpod/favorite_places.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceDetail extends ConsumerStatefulWidget {
  PlaceDetail({super.key, required this.placeIndex});
  int placeIndex;
  @override
  ConsumerState<PlaceDetail> createState() => _PlaceDetailState();
}

class _PlaceDetailState extends ConsumerState<PlaceDetail> {
  @override
  void initState() {
    super.initState();
    print(
      "Place Title: ${ref.read(favoritePlaces)[widget.placeIndex].location}",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.file(
            ref.read(favoritePlaces)[widget.placeIndex].image,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Positioned(
            top: 50,
            left: 20,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Text(
              ref.watch(favoritePlaces)[widget.placeIndex].title,
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            child: Text(
              ref.read(favoritePlaces)[widget.placeIndex].location,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
