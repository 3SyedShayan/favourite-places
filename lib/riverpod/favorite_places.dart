import 'package:favorite_places/model/place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoritePlaces = StateNotifierProvider<FavoritePlaces, List<Place>>  ((ref) {
return FavoritePlaces();
}
);

class FavoritePlaces extends StateNotifier<List<Place>> {
  FavoritePlaces() : super( []);
  void addString(String place) {
    Place newPlace = Place(title: place);
    state = [newPlace, ...state];
  }

  void removeString(String place) {
    state = state.where((item) => item != place).toList();
  }

}
