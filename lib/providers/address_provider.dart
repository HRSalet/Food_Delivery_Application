import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/address_model.dart';

class AddressProvider extends ChangeNotifier {
  final List<AddressModel> _addresses = [];

  List<AddressModel> get addresses => List.unmodifiable(_addresses);

  void addAddress(AddressModel address) {
    _addresses.add(address);
    notifyListeners();
  }

  void deleteAddress() {
    _addresses.removeLast();
    notifyListeners();
  }
}
