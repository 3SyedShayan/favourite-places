import 'package:favorite_places/riverpod/favorite_places.dart';
import 'package:favorite_places/screens/add_place.dart';
import 'package:favorite_places/screens/place_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    var watchPlaces = ref.watch(favoritePlaces);

    print("UI is rebuild");
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddPlace()),
              );
            },
          ),
        ],
      ),
      body: watchPlaces.isEmpty
          ? Center(child: Text("Pls Add Places", style: TextStyle(color:  Colors.white)))
          : ListView.builder(
              itemCount: watchPlaces.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PlaceDetail()),
                  );
                },
                child: Card(
                  
                  color: Colors.white,
                  child: Text(watchPlaces[index]),
                ),
              ),
            ),
    );
  }
}
