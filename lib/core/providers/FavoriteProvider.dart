import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<String> _favoriteProducts = [];

  List<String> get favoriteProducts => _favoriteProducts;

  bool isFavorite(String productId) {
    return _favoriteProducts.contains(productId);
  }

  void toggleFavorite(String productId) {
    if (_favoriteProducts.contains(productId)) {
      _favoriteProducts.remove(productId);
    } else {
      _favoriteProducts.add(productId);
    }

    notifyListeners();
  }
}