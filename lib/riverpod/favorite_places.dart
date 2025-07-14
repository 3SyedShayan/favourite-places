import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoritePlaces = StateNotifierProvider<FavoritePlaces, List<String>>  ((ref) {
return FavoritePlaces();
}
);
class FavoritePlaces extends StateNotifier<List<String>> {
  FavoritePlaces() : super([]);
  void addString(String place) {
    state = [...state, place];
  }

  void removeString(String place) {
    state = state.where((item) => item != place).toList();
  }

}
