import 'package:flutter/material.dart';

class FavoriteModel extends ChangeNotifier {
  final String imageUrl;
  final String title;
  final String description;
  bool _isFavorite;

  FavoriteModel({
    required this.imageUrl,
    required this.title,
    required this.description,
    bool isFavorite = false,
  }) : _isFavorite =
           isFavorite; // Initialize _isFavorite in the initializer list

  bool get isFavorite => _isFavorite;

  set isFavorite(bool newValue) {
    if (_isFavorite != newValue) {
      _isFavorite = newValue;
      notifyListeners();
    }
  }
}
