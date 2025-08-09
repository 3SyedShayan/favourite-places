import 'dart:io';

import 'package:favorite_places/model/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoritePlaces = StateNotifierProvider<FavoritePlaces, List<Place>>((
  ref,
) {
  return FavoritePlaces();
});

class FavoritePlaces extends StateNotifier<List<Place>> {
  FavoritePlaces() : super([]);
  void addString(String place, File image, String location) {
    Place newPlace = Place(title: place, image: image, location: location);
    state = [newPlace, ...state];
  }

  void removeString(String place) {
    state = state.where((item) => item != place).toList();
  }
}
