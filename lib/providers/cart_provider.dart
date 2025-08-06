import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cart_model.dart';

class CartProvider extends ChangeNotifier {
  final List<CartModel> _cartItems = [];

  List<CartModel> get cartItems => List.unmodifiable(_cartItems);

  void addToCart(CartModel item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(CartModel item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
