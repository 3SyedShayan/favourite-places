import 'package:favorite_places/riverpod/favorite_places.dart';
import 'package:favorite_places/screens/place_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesListScreen extends ConsumerStatefulWidget {
  const PlacesListScreen
({super.key});

  @override
  ConsumerState<PlacesListScreen
> createState() => _HomeState();
}

class _HomeState extends ConsumerState<PlacesListScreen> {
  @override
  Widget build(BuildContext context) {
    var watchPlaces = ref.watch(favoritePlaces);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/addPlace');
            },
          ),
        ],
      ),
      body: watchPlaces.isEmpty
          ? Center(child: Text("Pls Add Places", style: TextStyle(color:  Colors.white)))
          : ListView.builder(
              itemCount: watchPlaces.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(watchPlaces[index].title, style: TextStyle(color: Colors.white)),
                leading: CircleAvatar(
                  backgroundImage: FileImage(watchPlaces[index].image),
                ),
                trailing: Icon(Icons.arrow_forward),
            onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => PlaceDetail(placeIndex: index),
                  ));
                 
                },
                
           
              ),
            ),
    );
  }
}
